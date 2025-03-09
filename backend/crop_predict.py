from flask import Flask, request, jsonify
import pickle
import json
import numpy as np
import joblib
# Load the trained model and preprocessor
with open("market_price_rf_model.pkl", "rb") as model_file:
    model = joblib.load(model_file)

with open("preprocessor.pkl", "rb") as preprocessor_file:
    preprocessor = joblib.load(preprocessor_file)

with open("crop_recommend_data.json", "r") as json_file:
    crop_data = json.load(json_file)

app = Flask(__name__)

@app.route("/predict", methods=["POST"])
def predict():
    try:
        data = request.json
        crop = data.get("crop")
        soil_type = data.get("soilType")
        state = data.get("state")
        weather = data.get("weather")
        profitability = data.get("profitability")
        yield_tonnes = float(data.get("yield", 0))
        growing_duration = int(data.get("growingDuration", 0))

        # Preprocess input data
        input_data = np.array([[crop, soil_type, state, weather, profitability, yield_tonnes, growing_duration]])
        processed_data = preprocessor.transform(input_data)

        # Make prediction
        predicted_price = model.predict(processed_data)[0]

        # Fetch crop details
        crop_details = crop_data.get(crop, {})

        response = {
            "crop": crop,
            "predictedMarketPrice": round(predicted_price, 2),
            "growingDuration": growing_duration,
            "profitability": profitability,
            "weather": weather,
            "careInstructions": crop_details.get("careInstructions", [])
        }
        return jsonify(response)

    except Exception as e:
        return jsonify({"error": str(e)})
@app.route("/")
def home():
    return "Flask server is running!"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)  # Change port if needed
    app.run(debug=True)

@app.route("/")
def home():
    return "Flask server is running!"
