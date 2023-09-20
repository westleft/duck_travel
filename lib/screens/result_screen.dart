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
  late List<CityModel> cityList;
  late CityModel _selectCity;
  var routeData;
  var _resultData = [];
  var isLoading = true;

  @override
  void initState() {
    // getScenicSpotData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    routeData = ModalRoute.of(context)!.settings.arguments;
    cityList = routeData['dropDownList'];
    _selectCity = routeData['city'];
    print(cityList);
    getScenicSpotData();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void getScenicSpotData() async {
    try {
      setState(() {
        isLoading = true;
      });

      final city = routeData['city'].city;
      final res = await ApiRequest.getScenicByCity(city, 10, 1);
      _resultData = res;
      print(res);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: SingleChildScrollView(
        child: Container(
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
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          label: Text(
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
                !isLoading
                    ? Column(
                        children: _resultData.map((item) {
                        print(item.address);
                        return TourItem(
                            scenicSpotName: item.scenicSpotName,
                            picture: item.picture['PictureUrl1'],
                            address: item.address ?? '尚無提供地址',
                            openTime: item.openTime ?? '尚無提供時間',
                            ticketInfo: item.ticketInfo ?? '尚無票價資訊');
                      }).toList())
                    : Text('Loading')
              ],
            )),
      ),
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
