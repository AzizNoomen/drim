import 'package:appui/model/model.dart';

final plant1 = Plantinfo(
  imageUrl: 'assets/tomato.png',
  name: "Tomato",
  type: "Plants",
  anomalies: [],
  description: "Description 1",
  alltoknow: "alltoknow1",
  details: "details1",
  size: "small",
  ind: 0,
);

final plant2 = Plantinfo(
  imageUrl: 'assets/s3.png',
  name: "Strawberry",
  anomalies: ["Powdery Mildew", "Leaf scorch"],
  type: "Plants",
  description:
      " the strawberry plant is a low-growing perennial that produces compound leaves, small white or pink flowers, and juicy red berries. It also produces runners that allow it to spread across the ground and form new plants. The plant has a shallow root system and prefers well-drained soil with a slightly acidic pH.It typically grows to a height of 6-8 inches (15-20 cm) and can spread up to 2 feet (60 cm) wide. ",
  alltoknow:
      " the strawberry plant is a popular crop in agriculture for its sweet and juicy fruit. It can be propagated by runners or bare-root plants, and requires well-drained soil with a pH between 5.5 and 6.5. Pest and disease management strategies are important for maintaining healthy plants and maximizing yield.",
  details: "details2",
  size: "small",
  ind: 1,
);

final plant3 = Plantinfo(
  imageUrl: 'assets/orange.png',
  name: "Orange",
  type: "Anomalies",
  anomalies: ["Powdery Mildew"],
  description: "Description 3",
  alltoknow: "alltoknow3",
  details: "details3",
  size: "small",
  ind: 2,
);

final plant4 = Plantinfo(
  imageUrl: 'assets/peach.png',
  name: "Peach",
  type: "Plants",
  anomalies: ["Powdery Mildew"],
  description: "Description 4",
  alltoknow: "alltoknow4",
  details: "details4",
  size: "small",
  ind: 3,
);

final List<Plantinfo> allList = [plant1, plant2, plant3, plant4];
final List<Plantinfo> plantList = [plant1, plant2, plant4];
final List<Plantinfo> anomaliesList = [plant3];
