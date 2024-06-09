import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:newsapp_weather_graduation/widgets/catwidget.dart';
import 'package:newsapp_weather_graduation/widgets/text_widget.dart';




class GlobalMethods {
  static Future<void> errorDialog(
      {required String errorMessage, required BuildContext context}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(errorMessage),
            title: (Row(
              children: const [
                Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('An error occured'),
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
}

Future<void> errorDialog({
  required String subtitle,
  required BuildContext context,
}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/sign.png',
                height: 20.0,
                width: 20.0,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(' An Error occured'),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Textwidget(
                color: Colors.cyan,
                text: 'Ok',
                textsize: 18,
              ),
            ),
          ],
        );
      });
}

void navigateTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));

Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)? onchange,
  required String? Function(String? val)? validator,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefix,
          ),
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
        keyboardType: type,
        onChanged: onchange);

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  bool isUppercase = true,
  double raduis = 10,
  @required Function()? function,
  @required String? text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        height: 45.0,
        color: background,
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );

PreferredSizeWidget defaultAppbar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          IconlyLight.arrowLeft2,
        ),
      ),
      titleSpacing: 5.0,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: actions,
    );

Widget defaulttextbutton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Future<void> warningDialog({
  required String title,
  required String subtitle,
  required VoidCallback fct,
  required BuildContext context,
}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/sign.png',
                height: 20.0,
                width: 20.0,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(title),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Textwidget(
                color: Colors.cyan,
                text: 'Cancel',
                textsize: 18,
              ),
            ),
            TextButton(
              onPressed: fct,
              child: Textwidget(
                color: Colors.red,
                text: 'ok',
                textsize: 18,
              ),
            ),
          ],
        );
      });
}

Widget listtile({
  required String title,
  required IconData icon,
  String? subtitle,
  required Function onpressed,
  required Color color,
}) {
  return ListTile(
    title: Textwidget(
      color: color,
      text: title,
      textsize: 22.0,
      // istitle: true,
    ),
    subtitle: Textwidget(
      color: color,
      text: subtitle == null ? "" : subtitle,
      textsize: 18.0,
    ),
    leading: Icon(icon),
    trailing: Icon(IconlyLight.arrowRight2),
    onTap: () {
      onpressed();
    },
  );
}

Widget myDivider() => Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articlebuilder(list,context,{issearch=false})=>ConditionalBuilder(
  condition:list.length>0,
  builder:(context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index)=>CatWidget(list[index],context),
    separatorBuilder:(context,index)=>myDivider(),
    itemCount:10,
  ) ,
  fallback:(context)=>issearch?Container():Center(child: CircularProgressIndicator()) ,
);