import 'package:duck_travel/models/scenic_spot_models.dart';
import 'package:flutter/material.dart';
import 'package:duck_travel/widgets/app_bar.dart';
import 'package:flutter/services.dart';

// https://ptx.transportdata.tw/MOTC/v2/Tourism/Activity?%24top=200&%24format=JSON

class DetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailScreen();
  }
}

class _DetailScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    ScenicSpotModel data =
        ModalRoute.of(context)!.settings.arguments as ScenicSpotModel;

    final picture =
        data.picture?.pictureUrl1 ?? 'https://i.imgur.com/KLe66Ct.jpg';
    final address = data.address ?? '尚無提供地址';
    final openTime = data.openTime ?? '尚無提供時間';
    final ticketInfo = data.ticketInfo ?? '尚無票價資訊';
    final phone = data.phone ?? '尚無提供電話';
    final name = data.scenicSpotName!;
    final description = data.description ?? '尚無景點介紹';
    final descriptionDetail = data.descriptionDetail ?? '尚無景點介紹';

    void copyText(String text) {
      Clipboard.setData(ClipboardData(text: text));
    }

    return Scaffold(
      appBar: const Bar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              child: Image.network(
                picture,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.place),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 16),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5172C9), // 背景颜色
                      borderRadius: BorderRadius.circular(8.0), // 圆角
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 0), // padding
                    margin: const EdgeInsets.only(left: 24),
                    child: TextButton(
                      onPressed: () {
                        copyText(address);
                      },
                      child: const Text(
                        '複製地址',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5172C9),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  ListItem(
                    text: openTime,
                    icon: const Icon(Icons.timer_sharp),
                  ),
                  const SizedBox(height: 12),
                  ListItem(
                    text: ticketInfo,
                    icon: const Icon(Icons.attach_money),
                  ),
                  const SizedBox(height: 12),
                  ListItem(
                    text: description,
                    icon: const Icon(Icons.create),
                  ),
                  const SizedBox(height: 24),
                  const Divider(
                    color: Color(0xFF333333), // 可以更改颜色
                    height: 2, // 设置线的高度
                    thickness: 1, // 设置线的厚度
                  ),
                  const SizedBox(height: 24),
                  Text(
                    descriptionDetail,
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.text, required this.icon});

  String text;
  Icon icon;

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
            softWrap: true,
            // overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
