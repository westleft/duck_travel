import 'package:duck_travel/models/city_models.dart';
import 'package:duck_travel/models/scenic_spot_models.dart';
import 'package:flutter/material.dart';
import 'package:duck_travel/widgets/app_bar.dart';
import 'package:duck_travel/api/api_service.dart';
import 'package:logging/logging.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen> {
  final ScrollController _scrollController = ScrollController();
  static const pageLimit = 10;
  late List<CityModel> cityList;
  late CityModel _selectCity;
  List<ScenicSpotModel> _resultData = [];
  var routeData;
  var isLoading = true;

  Map<String, int> apiPayload = {
    "top": 10,
    "skip": 0
  };

  @override
  void didChangeDependencies() {
    routeData = ModalRoute.of(context)!.settings.arguments;
    cityList = routeData['dropDownList'];
    _selectCity = routeData['city'];

    getScenicSpotData();

    super.didChangeDependencies();
  }

  void getScenicSpotData() async {
    try {
      final city = _selectCity.city;
      final res = await ApiRequest.getScenicByCity(city, apiPayload['top'], apiPayload['skip']);
      print(res[0].scenicSpotName);
      _resultData.addAll(res);
      setState(() => isLoading = false);

      _scrollController.addListener(checkIsMaxScrollExtent);
    } catch (e) {
      print(e);
    }
  }

  void checkIsMaxScrollExtent() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _scrollController.removeListener(checkIsMaxScrollExtent);
      apiPayload['top'] =  apiPayload['top']! + pageLimit;
      apiPayload['skip'] = apiPayload['skip']! + pageLimit;
      getScenicSpotData();
    }
  }

  void resetPayload() {
    apiPayload['top'] = 10;
    apiPayload['skip'] = 0;
  }

  @override
  void dispose() {
    _scrollController.removeListener(checkIsMaxScrollExtent);
    _scrollController.dispose();
    super.dispose();
  }

  void addScrollEvent() {
    _scrollController.addListener(checkIsMaxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40), // 20 是圆角的半径
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: DropdownButton(
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
                            _selectCity = cityList
                                .firstWhere((city) => city.city == value);
                          });
                        },
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF79C31),
                        borderRadius: BorderRadius.circular(40), // 20 是圆角的半径
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          resetPayload();
                          getScenicSpotData();
                        }, 
                        icon: const Icon(Icons.search),
                        label: const Text(
                          '搜尋',
                          style: TextStyle(
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                // 使用Expanded包装ListView.builder以使其占据剩余空间
                child: ListView.builder(
                  itemCount: _resultData.length, // 项目数量
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _resultData[index];
                    return TourItem(
                      scenicSpotName: item.scenicSpotName!,
                      picture: item.picture?.pictureUrl1 ??
                          'https://i.imgur.com/T30xe2O.jpg',
                      address: item.address ?? '尚無提供地址',
                      openTime: item.openTime ?? '尚無提供時間',
                      ticketInfo: item.ticketInfo ?? '尚無票價資訊',
                    );
                  },
                ),
              ),
              if (isLoading) Text('Loading')
            ],
          )),
    );
  }
}

// https://i.imgur.com/xZqUPUu.png
class TourItem extends StatelessWidget {
  TourItem({
    super.key,
    required this.scenicSpotName,
    required this.picture,
    required this.address,
    required this.openTime,
    required this.ticketInfo,
  });

  String scenicSpotName;
  String picture;
  String address;
  String openTime;
  String ticketInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // 設定圖像的圓角半徑
                    child: Image.network(picture, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      scenicSpotName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis, // 使用省略号
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.place),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            address,
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.timer_sharp),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                            child: Text(
                          openTime,
                          style: TextStyle(fontSize: 16),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '牛山呼庭園區需區需區需區需區需付50元',
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFF333333), // 可以更改颜色
            height: 2, // 设置线的高度
            thickness: 1, // 设置线的厚度
          )
        ],
      ),
    );
  }
}
