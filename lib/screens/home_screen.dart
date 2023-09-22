import 'dart:ui';
import 'package:duck_travel/models/city_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:duck_travel/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:duck_travel/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  var cityList = [];
  var _selectCity;
  var isLoading = false;

  @override
  void initState() {
    getCity();
    super.initState();
  }

  void getCity() async {
    try {
      setState(() => isLoading = true);
      final res = await ApiRequest.getCity();
      cityList = res;
      _selectCity = cityList[0];
      setState(() => isLoading = false);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://i.imgur.com/gzURtg8.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '368個鄉鎮市區 總有一個你的菜',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '這次想去哪裡鴨？',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(40), // 20 是圆角的半径
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: !isLoading
                                  ? DropdownButton(
                                      isExpanded: true, // 设置为true以扩展宽度
                                      dropdownColor: Colors.white, // 下拉菜单的背景颜色
                                      value: _selectCity.city,
                                      items: cityList
                                          .map(
                                            (city) => DropdownMenuItem(
                                              value: city.city,
                                              child: Text(city.cityName),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _selectCity = cityList.firstWhere((city) => city.city == value);
                                        });
                                      },
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )
                                  : const Text('Loading...'),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFFF79C31),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/result', arguments: {
                                    'city': _selectCity,
                                    'dropDownList': cityList
                                  });
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                                label: const Text(
                                  '搜尋',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(
                              MediaQuery.of(context).size.width - 260, 240),
                          child: Image.network(
                            'https://i.imgur.com/vLFqvvi.png',
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              MediaQuery.of(context).size.width - 120, 240),
                          child: Image.network(
                            'https://i.imgur.com/k9pMAW9.png',
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '找個沒去過的',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        CityButton(
                          imgUrl: 'https://i.imgur.com/BpmdcFU.png',
                          text: '花蓮',
                          routePath: '/detail',
                        ),
                        const SizedBox(width: 24),
                        CityButton(
                          imgUrl: 'https://i.imgur.com/dfJkXRv.png',
                          text: '新北',
                          routePath: '/',
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        CityButton(
                          imgUrl: 'https://i.imgur.com/xZqUPUu.png',
                          text: '台中',
                          routePath: '/',
                        ),
                        const SizedBox(width: 24),
                        CityButton(
                          imgUrl: 'https://i.imgur.com/AS4EgCQ.png',
                          text: '南投',
                          routePath: '/',
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class CityButton extends StatelessWidget {
  const CityButton(
      {super.key,
      required this.imgUrl,
      required this.text,
      required this.routePath});
  final String imgUrl;
  final String text;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0, // 设置宽高比为1.0以确保是正方形
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.contain,
            ),
          ),
          child: TextButton(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, routePath);
            },
          ),
        ),
      ),
    );
  }
}
