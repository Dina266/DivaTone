import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {

  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  SongPlayerCubit() : super(SongPlayerInitial()) {
    audioPlayer.positionStream.listen((position){
      songPosition = position;
      updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duration){
      songDuration = duration!;

    });

  }

  void updateSongPlayer() {
    emit(SongPlayerSuccess());
  }
  

  Future<void> loadSong({required String url}) async{
    emit(SongPlayerLoading());
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerSuccess());
    } catch (e) {
      emit(SongPlayerFailure());
    }

  }

  void playOrPauseSong () {
    if(audioPlayer.playing) {
      audioPlayer.stop();
    }
    else{
      audioPlayer.play();
    }
    emit(SongPlayerSuccess());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
  

}
