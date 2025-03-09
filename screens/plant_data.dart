import '../models/plant_model.dart';

List<Plant> plants = [
  Plant(
    name: "Paddy",
    imageUrl: "lib/assets/images/paddy.jpeg",
    diseases: [
      Disease(
        name: "Bacterial Leaf Blight",
        description: "A serious disease of rice caused by the bacterium Xanthomonas oryzae.",
        pesticides: ["Copper Oxychloride", "Streptocycline"],
      ),
      // Add more diseases as needed
    ],
  ),
  Plant(
    name: "Wheat",
    imageUrl: "lib/assets/images/wheat.jpeg",
    diseases: [
      Disease(
        name: "Rust",
        description: "A fungal disease that affects the leaves, stems, and grains of wheat.",
        pesticides: ["Mancozeb", "Propiconazole"],
      ),
      // Add more diseases as needed
    ],
  ),
  // Add more plants as needed
];
