import 'package:appui/view/plantdetail_view.dart';
import 'package:flutter/material.dart';
import 'package:appui/model/model.dart';
import 'package:appui/model/plantinfo.dart';
import 'package:get/get.dart';

class PlantList extends StatefulWidget {
  const PlantList({super.key, required this.title});
  final String title;
  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  late ScrollController _scrollController;
  late List<Plantinfo> _list = [];
  late String plant;
  late String description;

  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeDescription);
    setState(() {
      if (widget.title == "All")
        _list = allList;
      else if (widget.title == "Plants")
        _list = plantList;
      else if (widget.title == "Anomalies") _list = anomaliesList;

      description = _list[0].description;
      plant = _list[0].name;
    });
  }

  changeDescription() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 195).round();
    print(value);
    setState(() {
      description = _list[descIndex].description;
      // plant = _plantList[descIndex].name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (int i = 0; i < _list.length; i++)
                Row(
                  children: <Widget>[
                    getPlantCard(_list[i].imageUrl, 'Rust', _list[i].type,
                        _list[i].name, _list[i].ind),
                    SizedBox(width: 30.0),
                  ],
                ),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 10.0, right: 25.0),
            child: Text(
              'Description',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500),
            )),
        Padding(
            padding: EdgeInsets.only(left: 25.0, top: 10.0, right: 25.0),
            child: Text(
              description,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300),
            )),
      ],
    );
  }

  getPlantCard(String imagePath, String anomalie, String plantType,
      String plantName, int i) {
    return Stack(children: <Widget>[
      Container(
          height: 325.0,
          width: 225.0,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF399D63),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 158, 158, 158),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 158, 158, 158),
                    blurRadius: 8,
                    offset: Offset(-4, 0),
                  ),
                ],
              ),
              height: 250.0,
              width: 225.0,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(children: <Widget>[
                        SizedBox(height: 10.0),
                        const Text(
                          'FROM',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)), // TextStyle
                        ), // Text
                        Text(
                          anomalie,
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)), // TextStyle
                        ),
                      ]),
                      const SizedBox(width: 10.0)
                    ],
                  ),
                  const SizedBox(height: 15),
                  Image(
                    image: AssetImage(imagePath),
                    height: 150.0,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 25.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              plantType,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8AC7A4)), // TextStyle
                            ),
                            Text(
                              plantName,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white), // TextStyle
                            ),
                          ])
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 28.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Colors.white.withOpacity(0.8), // TextStyle,
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.wb_sunny,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.water_drop_sharp,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.thermostat,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.cloud,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                    ],
                  )
                ],
              ))),
      Padding(
          padding: EdgeInsets.only(left: 90.0, top: 300.0),
          child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.black,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => PlantDetail(
                      index: i,
                    ),
                    transition: Transition.zoom,
                  );
                },
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  child: Icon(Icons.info_outline_rounded,
                      color: Colors.white, size: 30.0),
                ),
              ))),
      SizedBox(width: 30.0),
    ]);
  }
}
