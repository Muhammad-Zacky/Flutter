import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageDosen extends StatefulWidget {
  const PageDosen({super.key});

  @override
  State<PageDosen> createState() => _PageDosenState();
}

class _PageDosenState extends State<PageDosen> {
  TextEditingController nidn = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tanggallahir = TextEditingController();
  TextEditingController pendidikan = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String? valStatus, valPendidikan, inputForm;
  final _formKey = GlobalKey<FormState>();

  Future selectDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1945),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (pickDate != null) {
      tanggallahir.text = DateFormat("dd/MM/yyyy").format(pickDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Form Dosen", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "NIDN",
                  controller: nidn,
                  hintText: "2232323",
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 5),
                CostumeInput(
                  labelInput: "Nama",
                  controller: nama,
                  hintText: "arya",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 5),
                CostumeInput(
                  labelInput: "Tanggal lahir",
                  controller: tanggallahir,
                  hintText: "dd/mm/YYYY",
                  textInputType: TextInputType.datetime,
                  onTap: selectDate,
                ),
                SizedBox(height: 15),
                Text("Pendidikan", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: valPendidikan,
                    underline: Container(),
                    isExpanded: true,
                    items:
                        ['S1', 'S2', 'S3'].map((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                e,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valPendidikan = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Text("Status", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Row(
                  children: [
                    CostumRadio(
                      value: "Menikah",
                      groupValue: valStatus.toString(),
                      onChange: (val) {
                        setState(() {
                          valStatus = val;
                        });
                      },
                    ),
                    CostumRadio(
                      value: "Single",
                      groupValue: valStatus.toString(),
                      onChange: (val) {
                        setState(() {
                          valStatus = val;
                        });
                      },
                    ),

                  ],
                ),
                SizedBox(height: 5),
                CostumeInput(
                  labelInput: "Alamat",
                  controller: alamat,
                  hintText: "Padang",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15),
                CustomeButton(
                  bgColor: const Color.fromARGB(255, 12, 130, 173),
                  labelButton: "SAVE",
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        //cek input agama dan jenis kelamin
                        if (valPendidikan != null && valStatus != null) {
                          //ambil input//
                          inputForm =
                              "NIDN: ${nidn.text}\n"
                              "Nama: ${nama.text}\n"
                              "Tanggal lahir: ${tanggallahir.text}\n"
                              "Alamat: ${alamat.text}\n"
                              "Pendidikan: ${valPendidikan}\n"
                              "Status: ${valStatus.toString()}";
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(inputForm.toString())),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Silahkan Pilih Pendidikan dan Status Terlebih dahulu",
                              ),
                            ),
                          );
                        }
                      }
                    });
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

class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  const CostumeInput({
    super.key,
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
        Text(labelInput, style: TextStyle(fontSize: 18)),
        SizedBox(height: 5),
        TextFormField(
          controller: controller, //mendapatkan Input dari User
          validator: (val) {
            return val!.isEmpty ? "Input tidak boleh kosong" : null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: textInputType,
          obscureText: obscureText,
          onTap: () {
            //event ketika klik input
            onTap?.call();
          },
        ),
      ],
    );
  }
}

class CostumRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChange;

  const CostumRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val) {
          if (val != null) {
            onChange(val);
          }
        },
        title: Text(value),
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  final Color bgColor;
  final String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  const CustomeButton({
    super.key,
    required this.bgColor,
    required this.labelButton,
    required this.onPressed,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: bgColor,
      ),
      onPressed: () {
        onPressed.call();
      },
      child: Text(labelButton, style: TextStyle(color: labelColor)),
);}
}

