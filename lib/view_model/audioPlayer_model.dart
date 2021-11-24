import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_demo/provider/view_state_model.dart';

class AudioPlayerModel extends ViewStateModel {
  AssetsAudioPlayer assetsAudioPlayer;
  bool isPlaying = false;
  String _currentPlayingAudio;

  AudioPlayerModel() {
    this.init();
  }

  List<Audio> _playList;

  String get currentPlayingAudio {
    return this._currentPlayingAudio;
  }

  init() async {
    this.assetsAudioPlayer = AssetsAudioPlayer();
    this._playList = [
      Audio.network(
        "https://www.ytmp3.cn/down/75509.mp3",
        metas: Metas(
          title: "反方向的钟",
          artist: "周杰伦",
          album: "CountryAlbum",
        ),
      ),
      Audio.network(
        "https://www.ytmp3.cn/down/35982.mp3",
        metas: Metas(
          title: "Uptown Funk",
          artist: "Mark Ronson",
          album: "CountryAlbum",
        ),
      )
    ];
    try {
      await this.assetsAudioPlayer.open(Playlist(audios: this._playList),
          showNotification: true, autoStart: false);
      this.updatePlayState();
    } catch (e) {
      print('音乐列表初始化失败！' + e);
    }
    this._currentPlayingAudio = this._playList[0].metas.title;
  }

  updatePlayState() {
    this.isPlaying = this.assetsAudioPlayer.isPlaying.value;
    this.notifyListeners();
  }

  audioPlayOrPause() async {
    await this.assetsAudioPlayer.playOrPause();
    this.updatePlayState();
  }

  audioPlayAtIndex(int index) async {
    await this.assetsAudioPlayer.playlistPlayAtIndex(index);
    this._currentPlayingAudio = this._playList[index].metas.title;
    updatePlayState();
  }
}
