import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';
import 'package:tab_cach/features/children/presentation/manager/add_children/children_cubit.dart';

import '../../../../../core/widgets/custom_text_form_faild.dart';
import '../../manager/children_list/children_list_cubit.dart';

final TextEditingController nameEditingController = TextEditingController();
final TextEditingController PhoneEditingController = TextEditingController();
final TextEditingController passwordEditingController = TextEditingController();
Future<void> showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      double heightScreen = MediaQuery.of(context).size.height;
   

      return BlocProvider(
        create: (context) => ChildrenCubit(),
        child: BlocConsumer<ChildrenCubit, ChildrenState>(
          listener: (context, state) {
            if (state is ChildrenFailure) {
              Get.snackbar(
                "Message",
                "",
                backgroundColor: Colors.grey,
                messageText: Text(
                  "${state.errorMessage}",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (state is ChildrenSuccess) {
              Get.snackbar(
                "Message",
                "",
                backgroundColor: Colors.grey,
                messageText: Text(
                  "The kids have been added successfully",
                  style: TextStyle(color: Colors.white),
                ),
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AlertDialog(
              backgroundColor: kContainerColor,
              title: Text('Add children'.translat(context)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    CustomTextFormFaild(
                      hintText: "Name",
                      obscureText: false,
                      textEditingController: nameEditingController,
                    ),
                    SizedBox(
                      height: heightScreen * 0.02,
                    ),
                    CustomTextFormFaild(
                      hintText: "Phone Number",
                      obscureText: false,
                      textEditingController: PhoneEditingController,
                    ),
                    SizedBox(
                      height: heightScreen * 0.02,
                    ),
                    CustomTextFormFaild(
                      hintText: "Password",
                      obscureText: false,
                      textEditingController: passwordEditingController,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ConditionalBuilder(
                  condition: state is! ChildrenLoading,
                  builder: (context) {
                    return TextButton(
                      child: const Text('Add'),
                      onPressed: () {
                        ChildrenCubit.get(context).addChildren(
                            full_name: nameEditingController.text,
                            phone: PhoneEditingController.text,
                            password: passwordEditingController.text);
                        context.read<ChildrenListCubit>().getData();
                        
                      },
                    );
                  },
                  fallback: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
