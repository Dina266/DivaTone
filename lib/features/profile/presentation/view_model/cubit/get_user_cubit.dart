import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diva_tone/core/components/constatnts/app_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../model/get_user.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());

  Future getUser() async {
    emit(GetUserLoading());
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();

          final GetUserModel getUserModel = GetUserModel.fromJson(userDoc.data());

          getUserModel.imageUrl= FirebaseAuth.instance.currentUser?.photoURL?? AppUrls.defaultImage;
          final userEntity = getUserModel.toEntity();
      
        emit(GetUserSuccess(userEntity: userEntity));
        
      }
    catch (e) {
      emit(GetUserFailure());
    }

  }
}
