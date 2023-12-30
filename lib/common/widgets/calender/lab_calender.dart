import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class LabCalender extends StatelessWidget {
  const LabCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: dark
                  ? TColors.white.withOpacity(0.5)
                  : TColors.black.withOpacity(0.5))),
      height: 420,
      child: SfCalendar(
        view: CalendarView.workWeek,
        viewHeaderHeight: 50,
        timeSlotViewSettings: const TimeSlotViewSettings(
          startHour: 9.0,
          endHour: 17.0,
          nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
        ),
        allowAppointmentResize: true,
        allowDragAndDrop: true,
        headerStyle: CalendarHeaderStyle(
            backgroundColor: Colors.grey,
            textStyle: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white)),
        initialDisplayDate: DateTime.now(),
        showWeekNumber: true,
        showCurrentTimeIndicator: true,
        cellBorderColor: dark
            ? TColors.white.withOpacity(0.5)
            : TColors.black.withOpacity(0.5),
      ),
    );
  }
}
