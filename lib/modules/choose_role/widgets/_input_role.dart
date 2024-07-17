part of '../view/choose_role_page.dart';

class _SelectRoleWidgets extends StatelessWidget {
  const _SelectRoleWidgets();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: DropdownButtonFormField(
        style: const TextStyle(
          fontSize: 16,
        ),
        validator: (value) {
          if (value == null) return 'Harap pilih role terlebih dahulu';
          return null;
        },
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor.withOpacity(0.10),
          labelText: 'Choose role u are',
          border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        items: const [
          DropdownMenuItem(
            value: "Student",
            child: Text("Student"),
          )
        ],
        onChanged: (value) {},
      ),
    );
  }
}
