from flask import Flask, request, jsonify
import io
import os
import numpy as np
from PIL import Image
import tensorflow as tf
from flask_cors import CORS


app = Flask(__name__)
CORS(app, resources={r"/detect_disease": {"origins": "*"}})  # ✅ CORS only for API route

# ✅ Set Correct Model Path
MODEL_PATH = r"C:\Users\ajith\AndroidStudioProjects\innovativeaicrop\lib\models\crop_disease_model.tflite"

# ✅ Verify Model Exists
if not os.path.exists(MODEL_PATH):
    raise FileNotFoundError(f"🚨 Model file not found: {MODEL_PATH}")

# ✅ Load TFLite Model
try:
    interpreter = tf.lite.Interpreter(model_path=MODEL_PATH)
    interpreter.allocate_tensors()
    input_details = interpreter.get_input_details()
    output_details = interpreter.get_output_details()
    print(f"✅ Model Loaded: {MODEL_PATH}")
    print(f"Expected Input Shape: {input_details[0]['shape']}")  # Debug input shape
except Exception as e:
    raise RuntimeError(f"🔥 Failed to load model: {str(e)}")

# ✅ Class Labels
class_labels = {
    0: "American Bollworm on Cotton", 1: "Anthracnose on Cotton", 2: "Army worm",
    3: "Bacterial Blight in Rice", 4: "Brownspot", 5: "Common Rust", 6: "Cotton Aphid",
    7: "Flag Smut", 8: "Gray Leaf Spot", 9: "Healthy Maize", 10: "Healthy Wheat",
    11: "Healthy Cotton", 12: "Leaf Curl", 13: "Leaf Smut", 14: "Mosaic Sugarcane",
    15: "RedRot Sugarcane", 16: "RedRust Sugarcane", 17: "Rice Blast", 18: "Sugarcane Healthy",
    19: "Tungro", 20: "Wheat Brown Leaf Rust", 21: "Wheat Stem Fly", 22: "Wheat Aphid",
    23: "Wheat Black Rust", 24: "Wheat Leaf Blight", 25: "Wheat Mite", 26: "Wheat Powdery Mildew",
    27: "Wheat Scab", 28: "Wheat Yellow Rust", 29: "Wilt", 30: "Yellow Rust Sugarcane",
    31: "Bacterial Blight in Cotton", 32: "Bollrot on Cotton", 33: "Bollworm on Cotton",
    34: "Cotton Mealy Bug", 35: "Cotton Whitefly", 36: "Maize Ear Rot", 37: "Maize Fall Armyworm",
    38: "Maize Stem Borer", 39: "Pink Bollworm in Cotton", 40: "Red Cotton Bug", 41: "Thrips on Cotton"
}

@app.route('/', methods=['GET'])
def index():
    return jsonify({"message": "🌱 Welcome to Crop Disease Detection API"}), 200

@app.route('/detect_disease', methods=['POST'])
def detect_disease():
    if 'image' not in request.files:
        return jsonify({"error": "⚠️ No image provided."}), 400

    file = request.files['image']
    try:
        image = Image.open(io.BytesIO(file.read()))
        if image.mode != 'RGB':
            image = image.convert('RGB')  # ✅ Ensure RGB format
    except Exception:
        return jsonify({"error": "🚨 Invalid image file."}), 400

    try:
        predicted_disease = predict_disease(image)
        return jsonify({"disease": predicted_disease}), 200
    except Exception as e:
        return jsonify({"error": f"❌ Prediction failed: {str(e)}"}), 500

def predict_disease(image):
    """Preprocess image and predict disease"""
    img = image.resize((224, 224))
    img_array = np.array(img, dtype=np.float32) / 255.0  # Normalize
    img_array = np.expand_dims(img_array, axis=0).astype(np.float32)  # Ensure correct dtype

    # ✅ Debug input shape
    print(f"Actual Input Shape: {img_array.shape}")

    try:
        interpreter.set_tensor(input_details[0]['index'], img_array)
        interpreter.invoke()
        preds = interpreter.get_tensor(output_details[0]['index'])

        predicted_index = np.argmax(preds[0])
        return class_labels.get(predicted_index, "Unknown Disease")
    except Exception as e:
        print(f"🔥 Prediction Error: {str(e)}")
        return "Prediction Failed"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)  # ✅ Allow external access
