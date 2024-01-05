import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_check/features/emergency/presentation/cubit/contacts_state.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/database/cache/sqflite_helper.dart';
import '../../../../core/service/service_locator.dart';
import '../../data/model/contacts_model.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();




  void insertContacts() async {
    emit(InsertContactsLoadingState());
    //await Future.delayed(const Duration(seconds: 3));

    try {
      await sl<SqfLiteHelper>().insertToDB(
        ContactsModel(
          name: nameController.text,
          number: numberController.text,

        ),
      );
      getContacts();

      nameController.clear();
      numberController.clear();
      // currentDate = DateTime.now();
      // currentIndex = 0;

      emit(InsertContactsSuccessState());
    } catch (e) {
      //log(e.toString());
      emit(InsertContactsErrorState());
    }
  }


  List<ContactsModel> contactsList = [];

  void getContacts() async {
    emit(GetContactsErrorState());
    try {
      final value = await sl<SqfLiteHelper>().getFromDB();
      print(value.toString());

      contactsList = value
          .map((e) => ContactsModel.fromJson(e))
          .toList();
      emit(GetContactsSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetContactsErrorState());
    }
  }

  //update task
  // void updateTask(id) async {
  //   emit(UpdateTaskLoadingState());
  //   await sl<SqfLiteHelper>().updateDB(id).then((value) {
  //     emit(UpdateTaskSuccessState());
  //     getTasks();
  //   }).catchError((e) {
  //     debugPrint(e.toString());
  //     emit(UpdateTaskErrorState());
  //   });
  // }
  //

  //delete task
  void deleteContacts(id) async {
    emit(DeleteContactsLoadingState());
    await sl<SqfLiteHelper>().deleteFromDB(id).then((value) {
      emit(DeleteContactsSuccessState());
      getContacts();
    }).catchError((e) {
      debugPrint(e.toString());
      emit(DeleteContactsErrorState());
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }



}
