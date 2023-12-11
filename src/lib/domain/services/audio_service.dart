import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_service.g.dart';

enum AudioType { success, scan }

final audioFiles = {
  AudioType.success: 'audio/success.mp3',
  AudioType.scan: 'audio/scan.mp3',
};

class AudioService {
  final AudioPlayer _audioPlayer;

  AudioService(this._audioPlayer);

  Future<void> play(AudioType type) async {
    final file = audioFiles[type]!;

    print('Playing audio file: $file');

    await _audioPlayer.play(
      AssetSource(file),
      mode: PlayerMode.lowLatency,
    );
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }
}

@Riverpod(keepAlive: true)
AudioService audioService(AudioServiceRef ref) {
  return AudioService(
    AudioPlayer(
      playerId: 'audio_service_player',
    ),
  );
}
