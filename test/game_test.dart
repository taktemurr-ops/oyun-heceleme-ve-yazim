import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_heceleme_ve_yazim/oyun_heceleme_ve_yazim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dogruYazimConfig.title.length, 33);
    expect(dogruYazimConfig.tagline.length, 33);
    for (final s in dogruYazimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dogruYazimConfig.gameId, dogruYazimId);
    expect(dogruYazimRules.gameId, dogruYazimId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dogruYazimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dogruYazimId, optionalMechanics: dogruYazimRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      dogruYazimRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(dogruYazimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
