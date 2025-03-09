import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarketPricePredictionScreen extends StatefulWidget {
  @override
  _MarketPricePredictionScreenState createState() => _MarketPricePredictionScreenState();
}

class _MarketPricePredictionScreenState extends State<MarketPricePredictionScreen> {
  final TextEditingController cropController = TextEditingController();
  final TextEditingController soilTypeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController weatherController = TextEditingController();
  final TextEditingController profitabilityController = TextEditingController();
  final TextEditingController yieldController = TextEditingController();
  final TextEditingController growingDurationController = TextEditingController();

  String? _predictionResult;
  bool _isLoading = false;

  Future<void> _predictMarketPrice() async {
    setState(() {
      _isLoading = true;
      _predictionResult = null;
    });

    final url = Uri.parse("http://127.0.0.1:5001/predict"); // Change to your Flask server IP
    final Map<String, dynamic> requestData = {
      "crop": cropController.text,
      "soilType": soilTypeController.text,
      "state": stateController.text,
      "weather": weatherController.text,
      "profitability": profitabilityController.text,
      "yield": yieldController.text,
      "growingDuration": growingDurationController.text,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _predictionResult = "Predicted Price: ₹${data['predictedMarketPrice']}\n"
              "Care Instructions: ${data['careInstructions'].join(", ")}";
          _isLoading = false;
        });
      } else {
        setState(() {
          _predictionResult = "Error: Failed to get prediction.";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _predictionResult = "Error: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market Price Prediction")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(cropController, "Crop Name"),
              _buildTextField(soilTypeController, "Soil Type"),
              _buildTextField(stateController, "State"),
              _buildTextField(weatherController, "Weather Condition"),
              _buildTextField(profitabilityController, "Profitability"),
              _buildTextField(yieldController, "Yield (Tonnes)"),
              _buildTextField(growingDurationController, "Growing Duration (Days)"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _predictMarketPrice,
                child: _isLoading ? CircularProgressIndicator() : Text("Predict Price"),
              ),
              SizedBox(height: 20),
              if (_predictionResult != null)
                Text(_predictionResult!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
