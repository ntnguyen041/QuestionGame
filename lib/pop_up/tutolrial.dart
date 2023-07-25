import 'package:flutter/material.dart';

// ignore: camel_case_types
class tutolrial extends StatefulWidget {
  const tutolrial({
    Key? key,
  }) : super(key: key);
  @override
  State<tutolrial> createState() => _tutolrialState();
}

// ignore: camel_case_types
class _tutolrialState extends State<tutolrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      body: SingleChildScrollView(
          child: Column(
            children:const [
               Text(
                '-	Game này tạo ra nhằm mục đích mang đến cho người chơi hứng thú hơn trong việc học tập, ôn luyện lại các kiến thức của các môn học thông qua việc chơi game trên điện thoại, với việc các kiến thức được tạo ra dựa trên các câu hỏi và câu trả lời nhanh, đồng thời tạo ra sự ganh đua với các bạn bè, việc tạo ra game này giúp người chơi có thể vừa chới vừa học tiết kiệm thời gian mà vẫn đảm bảo kiến thức  và những người chơi khác việc này tạo ra sân chơi vui vẻ và cạnh tranh lành mạnh. Tạo ra những giấy phút thư giãn sau một ngày học tập căng thẳng. -	Đây là trò chơi được tổ chức theo dạng có bốn phương án trả lời, một đáp án đúng. Tổng cộng có 15 câu hỏi cho một set chơi tương ứng với chủ đề đã chọn. -	Người chơi có thể tranh tài với nhau thông qua những trận đối kháng, cùng trải nghiệm thi đua với nhiều đề tài hấp dẫn khác nhau. Đồng thời người chơi có thể tranh tài với nhau thông qua số điểm đã đạt được ở chế độ chơi đơn hoặc các thành tích đã được.-	Game này tạo ra nhằm mục đích mang đến cho người chơi hứng thú hơn trong việc học tập, ôn luyện lại các kiến thức của các môn học thông qua việc chơi game trên điện thoại, với việc các kiến thức được tạo ra dựa trên các câu hỏi và câu trả lời nhanh, đồng thời tạo ra sự ganh đua với các bạn bè, việc tạo ra game này giúp người chơi có thể vừa chới vừa học tiết kiệm thời gian mà vẫn đảm bảo kiến thức  và những người chơi khác việc này tạo ra sân chơi vui vẻ và cạnh tranh lành mạnh. Tạo ra những giấy phút thư giãn sau một ngày học tập căng thẳng. -	Đây là trò chơi được tổ chức theo dạng có bốn phương án trả lời, một đáp án đúng. Tổng cộng có 15 câu hỏi cho một set chơi tương ứng với chủ đề đã chọn. -	Người chơi có thể tranh tài với nhau thông qua những trận đối kháng, cùng trải nghiệm thi đua với nhiều đề tài hấp dẫn khác nhau. Đồng thời người chơi có thể tranh tài với nhau thông qua số điểm đã đạt được ở chế độ chơi đơn hoặc các thành tích đã được.',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )),
    );
  }
}
