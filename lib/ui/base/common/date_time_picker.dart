import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class DateTimePicker extends StatefulWidget {
  final Function(DateTime time) callback;
  final DateTime dateTime;
  const DateTimePicker(
      {required this.callback, required this.dateTime, super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime dateChanged = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyles.boldText14
                        .setColor(AppColors.redNotificationColor),
                  )),
              TextButton(
                  onPressed: () {
                    widget.callback(dateChanged);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Done",
                    style: TextStyles.boldText14
                        .setColor(AppColors.greenNotificationColor),
                  )),
            ],
          ),
        ),
        Divider(
          color: AppColors.colorDivider,
          height: 1,
        ),
        SizedBox(
          height: 216,
          child: CupertinoDatePicker(
            dateOrder: DatePickerDateOrder.dmy,
            initialDateTime: widget.dateTime,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            onDateTimeChanged: (DateTime newDate) {
              setState(() => dateChanged = newDate);
            },
          ),
        ),
      ],
    );
  }
}
