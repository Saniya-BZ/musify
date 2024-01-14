import 'package:flutter/material.dart';
import 'song.dart';
import 'package:audioplayers/audioplayers.dart';


class PlayListProvider extends ChangeNotifier{
  final List<Song> _playlist = [

    Song(
        songName: "Falling in Love",
        artistName:"Elvis priesley",
        albumArtImagePath: "images/img.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),

    Song(
        songName: "Night Changes",
        artistName:"One direction",
        albumArtImagePath: "images/img_1.png",
        audioPath: "assets/songs/nightchanges.mpeg"
    ),
    Song(
        songName: "Love Story",
        artistName:"Taylor Swift",
        albumArtImagePath: "images/img_2.png",
        audioPath: "assets/songs/lovestory.mpeg"
    ),
    Song(
        songName: "Love Me Like You Do",
        artistName:"Ellie Goulding",
        albumArtImagePath: "images/img_3.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "Let Me Love You",
        artistName:"Justien Bieber",
        albumArtImagePath: "images/img_4.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "Faded",
        artistName:"Alen Walker",
        albumArtImagePath: "images/img_5.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "F.R.I.E.N.D.S",
        artistName:"Anna Marie",
        albumArtImagePath: "images/img_6.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "Blank Space",
        artistName:"Taylor Swift",
        albumArtImagePath: "images/img_7.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "What Do You Mean?",
        artistName:"Justein Bieber",
        albumArtImagePath: "images/img_8.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "In The End",
        artistName:"Tommee Profitt",
        albumArtImagePath: "images/img_9.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "I Just Wanna Say",
        artistName:"Stephanie Mills",
        albumArtImagePath: "images/img_10.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
    Song(
        songName: "The Way It Was Before",
        artistName:"Johnny Stimson",
        albumArtImagePath: "images/img_11.png",
        audioPath: "assets/songs/fallinginlove.mpeg"
    ),
  ];

  int? _currentSongIndex;

  //audio player
  final AudioPlayer _audioPlayer= AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constuctor
  PlaylistProvider(){listenToDuration();}



  bool _isPlaying = false;
  //PLAY
  void play() async{
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();

  }
  //PAUSE
  void pause() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();

  }
  //RESUME
  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //PAUSE OR RESUME
  void pauseOrResume() async{
    if(_isPlaying){
      pause();
    }else{
      resume();
    }
    notifyListeners();
  }

//SEEK
  void seek(Duration position) async{
    await _audioPlayer.seek(position);
  }
//PLAY NEXT
  void playNextSong(){
    if(_currentSongIndex != null) {
      if(_currentSongIndex! < _playlist.length-1){
        currentSongIndex = _currentSongIndex! + 1;
      }
      else{
        currentSongIndex = 0;
      }
    }
  }
//PLAY PREVIOUS
  void playPreviousSong() async{
    if(_currentDuration.inSeconds > 2)
    {

    }
    else{
      if(_currentSongIndex! > 0){
        currentSongIndex = _currentSongIndex! - 1;

      }
      else{
        currentSongIndex = _playlist.length-1;
      }
    }
  }

  void listenToDuration(){
    _audioPlayer.onDurationChanged.listen((newDuration)
    {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition)
    {
      _currentDuration = newPosition;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event){
      playNextSong();
    });
  }





  //audio player


  List <Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;



  set currentSongIndex(int? newIndex){
    _currentSongIndex= newIndex;

    if (newIndex != null){
      play();
    }
    notifyListeners();
  }
}