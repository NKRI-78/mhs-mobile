part of '../view/new_student_page.dart';

class _InputBirthday extends StatefulWidget {
  const _InputBirthday();

  @override
  State<_InputBirthday> createState() => _InputBirthdayState();
}

class _InputBirthdayState extends State<_InputBirthday> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        var date = await showDatePicker(
            context: context,
            // locale: const Locale("id"),
            firstDate: DateTime(DateTime.now().year - 100),
            lastDate: DateTime(DateTime.now().year - 10, 
            DateTime.now().month,
            DateTime.now().day));

        if (date != null && context.mounted) {
          context
              .read<NewStudentCubit>()
              .copyToState(birthDate: date.toString());
          controller.text = DateFormat(
            'yMMMMd',
          ).format(date);
          setState(() {});
        }
      },
      decoration: InputDecoration(
        fillColor: whiteColor.withOpacity(0.10),
        filled: true,
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        counterText: "",
        counterStyle:
            const TextStyle(color: whiteColor, fontSize: fontSizeLarge),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: fontSizeLarge,
          fontWeight: FontWeight.w500,
        ),
        labelText: 'Tanggal Lahir',
        labelStyle: const TextStyle(
          fontSize: fontSizeLarge,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: const BorderSide(
        //       color: whiteColor,
        //       width: 1.0,
        //       ),
        // ),
      ),
    );
  }
}
