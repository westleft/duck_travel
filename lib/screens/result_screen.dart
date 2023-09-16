import 'package:duck_travel/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen> {
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
                        items: [
                          DropdownMenuItem(child: Text('新竹市')),
                        ],
                        onChanged: (value) {},
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
              Column(
                children: [
                  TourItem(),
                  TourItem(),
                  TourItem(),
                  TourItem(),
                  TourItem(),
                  TourItem(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// https://i.imgur.com/xZqUPUu.png
class TourItem extends StatelessWidget {
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
                  child: Image.network('https://i.imgur.com/BpmdcFU.png'),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '水璉、牛山海岸',
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
                            '花蓮縣974壽豐鄉牛山39之5號',
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
                          '每日10:00-18:00',
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
                            child: Text('牛山呼庭園區需區需區需區需區需付50元',
                                style: TextStyle(fontSize: 16),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1))
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
