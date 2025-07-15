import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tgllahir = TextEditingController();
  TextEditingController password = TextEditingController();
  String? valAgama, valJK, inputForm;
  final _formKey = GlobalKey<FormState>();

  Future<void> selectDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (pickDate != null) {
      setState(() {
        tgllahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
      });
    }
  }

  void showSaveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Data berhasil disimpan!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Form Register", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "Full Name",
                  controller: fullname,
                  hintText: "Muhammad Dzaki Arya Vega",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "Username",
                  controller: username,
                  hintText: "arya",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "Email",
                  controller: email,
                  hintText: "dzaki66@gmail.com",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "Tanggal Lahir",
                  controller: tgllahir,
                  hintText: "dd/mm/yyyy",
                  textInputType: TextInputType.datetime,
                  onTap: selectDate,
                ),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "Password",
                  controller: password,
                  hintText: "",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 15),
                Text("Pilih Agama", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    hint: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("Pilih Agama"),
                    ),
                    items: [
                      "Islam",
                      "Kristen Katolik",
                      "Hindu",
                      "Budha",
                      "Konghucu",
                    ].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valAgama = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Text("Jenis Kelamin", style: TextStyle(fontSize: 18)),
                Row(
                  children: [
                    CostumeRadio(
                      value: "Pria",
                      groupValue: valJK,
                      onChange: (val) {
                        setState(() {
                          valJK = val;
                        });
                      },
                    ),
                    CostumeRadio(
                      value: "Wanita",
                      groupValue: valJK,
                      onChange: (val) {
                        setState(() {
                          valJK = val;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CostumeButton(
                  bgcolor: Colors.green,
                  labelButton: "Save",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (valAgama != null && valJK != null) {
                        inputForm = "Fullname : ${fullname.text}\n"
                            "Username : ${username.text}\n"
                            "Email : ${email.text}\n"
                            "Tanggal Lahir : ${tgllahir.text}\n"
                            "Agama : ${valAgama.toString()}\n"
                            "Jenis Kelamin : ${valJK.toString()}";

                        showSaveDialog();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Silahkan pilih agama dan jenis kelamin")),
                        );
                      }
                    }
                  },
                  labelColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// WIDGET CostumeInput
class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  CostumeInput({
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput, style: TextStyle(fontSize: 16)),
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}

/// WIDGET CostumeRadio
class CostumeRadio extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChange;

  CostumeRadio({
    required this.value,
    required this.groupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
        ),
        Text(value),
      ],
    );
  }
}

/// WIDGET CostumeButton
class CostumeButton extends StatelessWidget {
  final Color bgcolor;
  final String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  CostumeButton({
    required this.bgcolor,
    required this.labelButton,
    required this.onPressed,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: bgcolor),
      child: Text(labelButton, style: TextStyle(color: labelColor)),
    );
  }
}
