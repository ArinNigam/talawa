import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';

class EventWidgets {
  //widget to get the date button
  Widget dateButton({@required Function() onTap, @required String dateText}) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        'Date',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: Text(
        dateText,
        style: const TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
  }

  //widget to get the time button
  Widget timeButton({
    @required String name,
    @required bool allDaySwitchVal,
    @required String timeText,
    @required Function() onTap,
  }) {
    return AbsorbPointer(
        absorbing: allDaySwitchVal,
        child: ListTile(
          onTap: onTap,
          leading: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          trailing: Text(
            timeText,
            style: TextStyle(
              color: !allDaySwitchVal ? UIData.secondaryColor : Colors.grey,
            ),
          ),
        ));
  }

  //widget to add the event
  Widget addEventFab({@required Function() onPressed}) {
    return FloatingActionButton(
      backgroundColor: UIData.secondaryColor,
      onPressed: onPressed,
      child: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  Widget inputField(
      {@required String name,
      @required TextEditingController controller,
      @required String errorText}) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          maxLines: name == 'Description' ? null : 1,
          controller: controller,
          decoration: InputDecoration(
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.teal),
            ),
            hintText: name,
          ),
        ));
  }

  Widget switchTile(
      {@required String name,
      @required bool switchValue,
      @required Function(bool) onChanged}) {
    return SwitchListTile(
      activeColor: UIData.secondaryColor,
      value: switchValue,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        name,
        style: TextStyle(color: Colors.grey[600]),
      ),
      onChanged: onChanged,
    );
  }

  Widget recurrenceDropdown({
    @required bool recurringSwitchVal,
    @required String recurrance,
    @required Function(String) onChanged,
    @required List<String> recurranceList,
  }) {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 5),
      leading: Text(
        'Recurrence',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: AbsorbPointer(
        absorbing: !recurringSwitchVal,
        child: DropdownButton<String>(
          style: TextStyle(
              color: recurringSwitchVal ? UIData.secondaryColor : Colors.grey),
          value: recurrance,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          items: recurranceList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
