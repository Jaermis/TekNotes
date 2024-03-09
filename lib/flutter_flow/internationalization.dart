import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? tlText = '',
  }) =>
      [enText, tlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'p4yctiao': {
      'en': 'Notification',
      'tl': '',
    },
    '29nth0l2': {
      'en': '1',
      'tl': '',
    },
    'e5ttvuve': {
      'en': 'Search',
      'tl': '',
    },
    'moz13c7g': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'hmubwi4i': {
      'en': 'Forums',
      'tl': '',
    },
    '2m1p9668': {
      'en': 'Quiz ',
      'tl': '',
    },
    '2d9b00y0': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    '4zylv6q8': {
      'en': 'Logout',
      'tl': '',
    },
    'hyfnpjql': {
      'en': 'For You',
      'tl': 'TekNotes Para sa Iyo',
    },
    'ut0vvp6v': {
      'en': 'Forum',
      'tl': 'Forum',
    },
    's0htzhbr': {
      'en': 'Notes',
      'tl': 'Mga Tala',
    },
    '63acklm5': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    '3x54bxt1': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    'hb8tt7v6': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'o60jfmt2': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    'qu9wjvlf': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    'md19maa7': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'leqr4bxr': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'd0rwcg62': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'y7g96xmx': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    '13mmaqz1': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'k7a1xr7c': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    'kpsdx7e1': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // NotesStorage
  {
    'm5wkk2yd': {
      'en': 'Notification',
      'tl': '',
    },
    'aubdb1ug': {
      'en': '1',
      'tl': '',
    },
    'cr0ns7hs': {
      'en': 'Search',
      'tl': '',
    },
    'z8cyhzvs': {
      'en': 'Notes Storage',
      'tl': '',
    },
    '13dbxt8l': {
      'en': 'Forums',
      'tl': '',
    },
    '2uunm93x': {
      'en': 'Quiz ',
      'tl': '',
    },
    'zis5smpf': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'b14fcvz3': {
      'en': 'Logout',
      'tl': '',
    },
    'imp3szsb': {
      'en': 'Search Here....',
      'tl': 'Maghanap dito....',
    },
    'flc5zlcx': {
      'en': 'Remove Filter',
      'tl': 'Alisin ang Filter',
    },
    'swxctg2n': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    '91m22ey1': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    'd3a4dqfs': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    '2vu2zpe8': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    'zuzjimn8': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    'k5qljisu': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'xvv5hsos': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'otpnfs6q': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    'mszy6r7k': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    '7gkb2lli': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    '60xovtsx': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    'l9vtusd7': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    'q8gscbbq': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    'wm17gji4': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    'qpnp3kzj': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    'jcetk0w7': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    '8ggh0v67': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    '7hinvtpg': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    'y1lm2gjt': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'h9lyi64j': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    'ik465wly': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    'o3lwq6ui': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    's1krqput': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    '3lal6nsg': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    'bgu2ieh0': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    'dca0gflo': {
      'en': '#SSP031',
      'tl': '#SSP031',
    },
    'xzo487lr': {
      'en': '#ECE254',
      'tl': '#ECE254',
    },
    'qowm7o5f': {
      'en': '#ECE204',
      'tl': '#ECE204',
    },
    'ron3krww': {
      'en': '#CPE264',
      'tl': '#CPE264',
    },
    'k5izo00y': {
      'en': '#CPE262',
      'tl': '#CPE262',
    },
    'i95c59x3': {
      'en': '#CPE234',
      'tl': '#CPE234',
    },
    '2ehekw8h': {
      'en': '#CPE232',
      'tl': '#CPE232',
    },
    '004iz9gq': {
      'en': '#CPE330',
      'tl': '#CPE330',
    },
    'f2gf5be9': {
      'en': '#CPE340',
      'tl': '#CPE340',
    },
    '3zmqxnqt': {
      'en': '#ES038',
      'tl': '#ES038',
    },
    'dzdk67wl': {
      'en': '#CPEPE361/SD',
      'tl': '#CPEPE361/SD',
    },
    '7yriy996': {
      'en': '#CPE381',
      'tl': '#CPE381',
    },
    'l97yd5lf': {
      'en': '#CPE363',
      'tl': '#CPE363',
    },
    '2i1znntl': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    '8jqr07kn': {
      'en': '#CPE335',
      'tl': '#CPE335',
    },
    'tgeo8jwt': {
      'en': '#CPE333',
      'tl': '#CPE333',
    },
    'bqu9nsd1': {
      'en': '#CPE331',
      'tl': '#CPE331',
    },
    're6agbr5': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'ge5ppum8': {
      'en': 'Tags',
      'tl': 'Mga tag',
    },
    'up8e0yjc': {
      'en': 'Search Tag....',
      'tl': 'Maghanap ng Tag....',
    },
    '0ov7dy96': {
      'en': 'Upload Note',
      'tl': 'Mag-upload ng Tala',
    },
    'y0dfcysr': {
      'en': 'My Uploaded Notes',
      'tl': 'Aking Mga Na-upload na Tala',
    },
    'o842p5jl': {
      'en': 'Instructors\' Notes',
      'tl': 'Mga Tala ng Instructor',
    },
    'vd0d2u13': {
      'en': 'Community Notes',
      'tl': 'Mga Tala ng Komunidad',
    },
    'krzzs6yh': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    'y7hpcvqn': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    '9x3d9b1c': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'cak5ski1': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    '35ld3po9': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    'ev7u02ap': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    '3186vj8h': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'dmzbjmn7': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'ylzhkeaf': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    'pnsv44c5': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'bpqv8tfr': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    '4kop4wzj': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // ProfilePage
  {
    'xyeuasfp': {
      'en': 'Notification',
      'tl': '',
    },
    'fsrsqkms': {
      'en': '1',
      'tl': '',
    },
    'wbplbos3': {
      'en': 'Search',
      'tl': '',
    },
    'glqcq24z': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'pgidja0q': {
      'en': 'Forums',
      'tl': '',
    },
    'ss47cy7u': {
      'en': 'Quiz ',
      'tl': '',
    },
    'neix2rkn': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'q6nnf8sg': {
      'en': 'Logout',
      'tl': '',
    },
    'ibgj7k1f': {
      'en': 'Followers',
      'tl': 'Mga tagasunod',
    },
    'py7qkbgu': {
      'en': 'Following',
      'tl': 'Sumusunod',
    },
    'trx5wh5t': {
      'en': 'Facebook',
      'tl': 'Facebook',
    },
    'axzmfdw9': {
      'en': 'LinkedIn',
      'tl': 'LinkedIn',
    },
    '33ban6ud': {
      'en': 'GitHub',
      'tl': 'GitHub',
    },
    'cg170o5a': {
      'en': 'Personal Website',
      'tl': 'Personal na Website',
    },
    'lgnt07rt': {
      'en': 'User Timeline',
      'tl': 'Timeline ng User',
    },
    '6at54td5': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    'tvtu9ubd': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    't68ngmsh': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'tbzbj9fl': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    '7kszzmlh': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    '7tuhp5x5': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'dv3b7boc': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'h5husg8i': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'k9nfnldl': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    '13nttvcc': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'irystcjw': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    'w3lbg2ho': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // SignIn
  {
    'qdz1l7lt': {
      'en': 'Welcome to TekNotes',
      'tl': 'Maligayang pagdating sa TekNotes',
    },
    'z405uc38': {
      'en': 'Hello! Please log in or Sign up to continue',
      'tl': 'Kamusta! Mangyaring mag-log in o Mag-sign up upang magpatuloy',
    },
    'n4gmbyn3': {
      'en': 'Login',
      'tl': 'Mag log in',
    },
    'yuix31f5': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    '80yhi3pm': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    'hb4xbruk': {
      'en': 'Password',
      'tl': 'Password',
    },
    'w6nkx2in': {
      'en': 'Password',
      'tl': 'Password',
    },
    'ei5evrtm': {
      'en': 'Forgot Password?',
      'tl': 'Nakalimutan ang password?',
    },
    'r4sc5u6a': {
      'en': 'Sign In',
      'tl': 'Mag-sign In',
    },
    '68axpoy0': {
      'en': 'Don\'t have an account?',
      'tl': 'Walang account?',
    },
    'yvhvwlcv': {
      'en': 'Sign Up',
      'tl': 'Mag-sign Up',
    },
    'jp1dz4lf': {
      'en': 'Please validate your email.',
      'tl': 'Paki-validate ang iyong email.',
    },
    'recg07ft': {
      'en': 'Please enter your CIT-U institutional email',
      'tl': 'Mangyaring ilagay ang iyong CIT-U na institusyonal na email',
    },
    'tl0ysbdq': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'k2k05gt3': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    'woju8w33': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    '7tqif7bk': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // SearchPage
  {
    'ajqbwwl3': {
      'en': 'Notification',
      'tl': '',
    },
    'alg507g2': {
      'en': '1',
      'tl': '',
    },
    '2qenbnqv': {
      'en': 'Search',
      'tl': '',
    },
    '7x4kxfyo': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'rebypwm3': {
      'en': 'Forums',
      'tl': '',
    },
    'fl7v6sru': {
      'en': 'Quiz ',
      'tl': '',
    },
    'q1aokj5h': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'oqkw6ucs': {
      'en': 'Logout',
      'tl': '',
    },
    'kimosfl4': {
      'en': '',
      'tl': 'Label dito...',
    },
    'a2c37c4l': {
      'en': 'Search here....',
      'tl': '',
    },
    '8sgw77x8': {
      'en': 'Instructor',
      'tl': 'Tagapagturo',
    },
    'yswrsgic': {
      'en': 'Student',
      'tl': 'Mag-aaral',
    },
    '3qdz4o3b': {
      'en': 'No Filter',
      'tl': 'Walang Filter',
    },
    'pn0tv1jp': {
      'en': 'Please select...',
      'tl': 'Pakipili...',
    },
    '0o7ylv8u': {
      'en': 'Search for an item...',
      'tl': 'Maghanap ng item...',
    },
    'gm3gpaxh': {
      'en': 'No Filter',
      'tl': 'Walang Filter',
    },
    '2owwm8p4': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    'wa1o6zhi': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    'ijd7opjh': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    'd5voukgf': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    'exv4ezey': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    'jfyhrp34': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    'nv1csejo': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'dkzkwbaf': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'rzb7gbu7': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    'mmqod09z': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    '4n7sqe5t': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    '01yw6ncj': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    'rkrd2og3': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    '4vm72vs0': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    'tfi7aw5c': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    '39oceavs': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    'h64dbhts': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    'lrjnxe6t': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    'iaspxho7': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    '4iu7pgr7': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'i4ut7njh': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    'o4mdw7jf': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    '8w0nxmb6': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    'bkhjkfgm': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    '5xkye0dh': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    '9sclra5e': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    'mz6ez144': {
      'en': '#SSP031',
      'tl': '#SSP031',
    },
    'fw9okzqb': {
      'en': '#ECE254',
      'tl': '#ECE254',
    },
    'pmd5qirs': {
      'en': '#ECE204',
      'tl': '#ECE204',
    },
    'fbf2vj5u': {
      'en': '#CPE264',
      'tl': '#CPE264',
    },
    'fd75jmoc': {
      'en': '#CPE262',
      'tl': '#CPE262',
    },
    '0sqltjf7': {
      'en': '#CPE234',
      'tl': '#CPE234',
    },
    'iof3cud3': {
      'en': '#CPE232',
      'tl': '#CPE232',
    },
    'sti902h3': {
      'en': '#CPE330',
      'tl': '#CPE330',
    },
    'i1ikmnw4': {
      'en': '#CPE340',
      'tl': '#CPE340',
    },
    'eux3msw0': {
      'en': '#ES038',
      'tl': '#ES038',
    },
    'k4fz30xq': {
      'en': '#CPEPE361/SD',
      'tl': '#CPEPE361/SD',
    },
    'dlhq1gy0': {
      'en': '#CPE381',
      'tl': '#CPE381',
    },
    'wkpyl9gf': {
      'en': '#CPE363',
      'tl': '#CPE363',
    },
    'o4l6du8j': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    'cuu4a63n': {
      'en': '#CPE335',
      'tl': '#CPE335',
    },
    'o5tgvzpn': {
      'en': '#CPE333',
      'tl': '#CPE333',
    },
    'qc3sriny': {
      'en': '#CPE331',
      'tl': '#CPE331',
    },
    'o2a8tao6': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'fsz6tvyp': {
      'en': 'Please select...',
      'tl': 'Pakipili...',
    },
    'cwt5xnx3': {
      'en': 'Search for an item...',
      'tl': 'Maghanap ng item...',
    },
    '9szl8cyv': {
      'en': 'User',
      'tl': 'Gumagamit',
    },
    '5iond5lq': {
      'en': 'Notes',
      'tl': 'Mga Tala',
    },
    '03wt3ont': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    'jf2rwdyc': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    '4wotg96c': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'orlcc4hz': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    '68ovrcze': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    's5oyymsn': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'q0ampmto': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'jb9mfm6h': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'iq46eob5': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    'lunkhkey': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'tifhedb2': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    '8vghrwpw': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // ForumPage
  {
    '3xmr91r3': {
      'en': 'Notification',
      'tl': '',
    },
    'uc39fr3b': {
      'en': '1',
      'tl': '',
    },
    'jx8wji63': {
      'en': 'Search',
      'tl': '',
    },
    'jvihszsu': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'vy2y4l4u': {
      'en': 'Forums',
      'tl': '',
    },
    'lkmuzuq8': {
      'en': 'Quiz ',
      'tl': '',
    },
    'zr88gnw8': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'flwvlf7c': {
      'en': 'Logout',
      'tl': '',
    },
    'xj2jdaii': {
      'en': 'Search Here....',
      'tl': 'Maghanap dito....',
    },
    'kmlqacwx': {
      'en': 'Remove Filter',
      'tl': 'Alisin ang Filter',
    },
    '4k301mam': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    '20sa10ad': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    'fzigp84p': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    'h3alxr59': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    '6eqgk2lb': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    'cg1t5fo2': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'jn3n2orj': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'e73s1j2v': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    'q12qo090': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    'sqfxag70': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    'ld5yino3': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    'vc7arsu8': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    'bie4ywjy': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    'kqtseynx': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    '19u9v4mv': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    'zpzo1zrs': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    'egbzv55a': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    '6k09rkfk': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    'k1x5kjg9': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'ng6bn9g4': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    'ry2aa9mw': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    '5ufucwll': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    '9y2fpbdy': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    'zxy2yu2o': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    'j569ccux': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    'zcoif4fw': {
      'en': '#SSP031',
      'tl': '#SSP031',
    },
    'caqfcnb0': {
      'en': '#ECE254',
      'tl': '#ECE254',
    },
    'qpc6250r': {
      'en': '#ECE204',
      'tl': '#ECE204',
    },
    'nfydg6w4': {
      'en': '#CPE264',
      'tl': '#CPE264',
    },
    'a81qf0yj': {
      'en': '#CPE262',
      'tl': '#CPE262',
    },
    '3w4qj6zk': {
      'en': '#CPE234',
      'tl': '#CPE234',
    },
    'd6sbamvj': {
      'en': '#CPE232',
      'tl': '#CPE232',
    },
    '7w5ydsh4': {
      'en': '#CPE330',
      'tl': '#CPE330',
    },
    'tkuav0al': {
      'en': '#CPE340',
      'tl': '#CPE340',
    },
    'yerg565u': {
      'en': '#ES038',
      'tl': '#ES038',
    },
    '85lguq9b': {
      'en': '#CPEPE361/SD',
      'tl': '#CPEPE361/SD',
    },
    'autk3jhr': {
      'en': '#CPE381',
      'tl': '#CPE381',
    },
    'l3rylvmc': {
      'en': '#CPE363',
      'tl': '#CPE363',
    },
    'h11n5ucf': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    'foms8vrf': {
      'en': '#CPE335',
      'tl': '#CPE335',
    },
    'rn3nnjcw': {
      'en': '#CPE333',
      'tl': '#CPE333',
    },
    'ckmwlvss': {
      'en': '#CPE331',
      'tl': '#CPE331',
    },
    'lwk4i7ga': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'q9au4sbi': {
      'en': 'Tags',
      'tl': 'Mga tag',
    },
    'ck73klur': {
      'en': 'Search Tag....',
      'tl': 'Maghanap ng Tag....',
    },
    '7irdd0oe': {
      'en': 'Upload Post',
      'tl': 'Mag-upload ng Post',
    },
    'bsyxeftt': {
      'en': 'Latest',
      'tl': 'Pinakabago',
    },
    'f8bztzpb': {
      'en': 'Trending',
      'tl': 'Trending',
    },
    'v5rdw0k8': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    '0mth5m87': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    's4ljx10w': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'llktt1p6': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    '9rq1955d': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    '047no361': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'brc8eenm': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    '2sbbd7f1': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'vyjjdo39': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    'ybh2kajs': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'nu51kyxl': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    'd0s43khk': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // QuizzesPage
  {
    'xerdi7kg': {
      'en': 'Notification',
      'tl': '',
    },
    'y7m5jrzg': {
      'en': '1',
      'tl': '',
    },
    'jl6500n7': {
      'en': 'Search',
      'tl': '',
    },
    'pi1nw97m': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'xoz2769a': {
      'en': 'Forums',
      'tl': '',
    },
    'fy9uj53b': {
      'en': 'Quiz ',
      'tl': '',
    },
    'euif2so3': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'ar4gkqqa': {
      'en': 'Logout',
      'tl': '',
    },
    'kg1skae8': {
      'en': 'Quizzes',
      'tl': '',
    },
    'bdsoc0dv': {
      'en': 'Search Here....',
      'tl': 'Maghanap dito....',
    },
    'wh00eljj': {
      'en': 'Remove Filter',
      'tl': 'Alisin ang Filter',
    },
    '1z3lndis': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    'jqmipgxk': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    'ipotyvil': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    '03s0tcoz': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    '6vrdjprz': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    '0n4d99vu': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'nmkwto9a': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'am2pnnh0': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    '82csv946': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    'tov9d6lq': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    '3c2e4zmo': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    '5azr3rby': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    'ccxd9l5q': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    'dm4bngha': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    '57pq64q8': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    'lyg19uu3': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    '0ka5jrpu': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    'w6x29nlq': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    'as55pp11': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'bpeiv2qd': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    'il6sw9p0': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    '8bdtijho': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    '2f76drx2': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    'qaoazddj': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    'u4v4bep0': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    'ydgut7f6': {
      'en': '#SSP031',
      'tl': '#SSP031',
    },
    'o7mqjcer': {
      'en': '#ECE254',
      'tl': '#ECE254',
    },
    'n7gaeiua': {
      'en': '#ECE204',
      'tl': '#ECE204',
    },
    'jq932j5q': {
      'en': '#CPE264',
      'tl': '#CPE264',
    },
    '3wf65ksf': {
      'en': '#CPE262',
      'tl': '#CPE262',
    },
    'p0avkzqh': {
      'en': '#CPE234',
      'tl': '#CPE234',
    },
    '65nxm3us': {
      'en': '#CPE232',
      'tl': '#CPE232',
    },
    'f70z9obe': {
      'en': '#CPE330',
      'tl': '#CPE330',
    },
    'gezmv5dt': {
      'en': '#CPE340',
      'tl': '#CPE340',
    },
    '9bito0s7': {
      'en': '#ES038',
      'tl': '#ES038',
    },
    'v0l5cox8': {
      'en': '#CPEPE361/SD',
      'tl': '#CPEPE361/SD',
    },
    'yn2au2ex': {
      'en': '#CPE381',
      'tl': '#CPE381',
    },
    'v6mrq4hz': {
      'en': '#CPE363',
      'tl': '#CPE363',
    },
    'qcu5pvjd': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    '7oeiooci': {
      'en': '#CPE335',
      'tl': '#CPE335',
    },
    'm7vd7mis': {
      'en': '#CPE333',
      'tl': '#CPE333',
    },
    'qme45iet': {
      'en': '#CPE331',
      'tl': '#CPE331',
    },
    'jtqq9b7i': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'tvwm873r': {
      'en': 'Tags',
      'tl': 'Mga tag',
    },
    '2ux4vdee': {
      'en': 'Search Tag....',
      'tl': 'Maghanap ng Tag....',
    },
    '998526ng': {
      'en': 'Upload Quiz',
      'tl': 'Mag-upload ng Tala',
    },
    'zc243eou': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    '5nhmd2wg': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    'i9xxoint': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'kgt2jdyi': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    'y11mu4do': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    'lnza04od': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'b7uyb2i5': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'hkjss88p': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'hlmcazfg': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    'h4274n1c': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'xh55c0gi': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    '3a0xxhfq': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // PomodoroPage
  {
    'i5y2rqjy': {
      'en': 'Notification',
      'tl': '',
    },
    'joghg619': {
      'en': '1',
      'tl': '',
    },
    '493cug48': {
      'en': 'Search',
      'tl': '',
    },
    'vsktpqy6': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'b8cok222': {
      'en': 'Forums',
      'tl': '',
    },
    'b35s1aw6': {
      'en': 'Quiz ',
      'tl': '',
    },
    'xbag84z4': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'tjyc24ue': {
      'en': 'Logout',
      'tl': '',
    },
    't8sg8okd': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'bnpqadxd': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    'ycpopdnq': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    'qd90uxvk': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    '0sc7to52': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    'a3yqn1y4': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    'w0ccc6k7': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'biviou1e': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'j01zcju6': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    '9r3ilwg8': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    '95zo2ix0': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    '96g34950': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    'fzp7yzsb': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // SignupPage
  {
    'o98t55lj': {
      'en': 'Welcome to TekNotes',
      'tl': 'Maligayang pagdating sa TekNotes',
    },
    'v0bi4d6c': {
      'en': 'Hello! Please log in or Sign up to continue',
      'tl': 'Kamusta! Mangyaring mag-log in o Mag-sign up upang magpatuloy',
    },
    'k87ot4n3': {
      'en': 'Create Account',
      'tl': 'Lumikha ng Account',
    },
    'foy4y2o7': {
      'en': 'First Name',
      'tl': 'Pangalan',
    },
    'a9fmn2bb': {
      'en': 'First Name',
      'tl': 'Pangalan',
    },
    'e6rt4foj': {
      'en': 'Last Name',
      'tl': 'Huling pangalan',
    },
    '7vryrbgb': {
      'en': 'Last Name',
      'tl': 'Huling pangalan',
    },
    'nvxkkgl3': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    '230ebra6': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    'u9108it8': {
      'en': 'ID Number',
      'tl': 'ID Number',
    },
    'jovimfjp': {
      'en': 'ID Number',
      'tl': 'ID Number',
    },
    'is0c9mfj': {
      'en': 'BSARCH',
      'tl': 'BSARCH',
    },
    'ebmzqomz': {
      'en': 'BSCHE',
      'tl': 'BSCHE',
    },
    'whrkhyjb': {
      'en': 'BSCE',
      'tl': 'BSCE',
    },
    'bi7j8knz': {
      'en': 'BSCPE',
      'tl': 'BSCPE',
    },
    'cab3of1n': {
      'en': 'BSEE',
      'tl': 'BSEE',
    },
    '3jylle2h': {
      'en': 'BSECE',
      'tl': 'BSECE',
    },
    '97n28o9b': {
      'en': 'BSIE',
      'tl': 'BSIE',
    },
    'dvlv2kg1': {
      'en': 'BSME',
      'tl': 'BSME',
    },
    'xwdl2qe1': {
      'en': 'BSMinE',
      'tl': 'BSMinE',
    },
    'e2i052h0': {
      'en': 'BSAcc',
      'tl': 'BSAcc',
    },
    'yd8obgun': {
      'en': 'BSAIS',
      'tl': 'BSAIS',
    },
    'woytxbmk': {
      'en': 'BSMA',
      'tl': 'BSMA',
    },
    'no4xsqt9': {
      'en': 'BSBusinessAd',
      'tl': 'BSBusinessAd',
    },
    'otwkj871': {
      'en': 'BSHM',
      'tl': 'BSHM',
    },
    'vecaf3jv': {
      'en': 'BSTourism',
      'tl': 'BSTturismo',
    },
    'pnk6x2qt': {
      'en': 'BSOfficeAd',
      'tl': 'BSOfficeAd',
    },
    'p71fcel6': {
      'en': 'BSPubAd',
      'tl': 'BSPubAd',
    },
    'r4ru3ggq': {
      'en': 'ABComm',
      'tl': 'ABComm',
    },
    '3qi1xnmn': {
      'en': 'BAEL',
      'tl': 'BAEL',
    },
    'mmnumqkw': {
      'en': 'BEED',
      'tl': 'BEED',
    },
    'tixyvzin': {
      'en': 'BSEd',
      'tl': 'BSEd',
    },
    '38chgdy7': {
      'en': 'BMMA',
      'tl': 'BMMA',
    },
    'fli0taeh': {
      'en': 'BSBio',
      'tl': 'BSBio',
    },
    'pqr4d0t7': {
      'en': 'BSMath',
      'tl': 'BSMath',
    },
    '3fyop1uu': {
      'en': 'BSPsych',
      'tl': 'BSPsych',
    },
    '2e63ji8r': {
      'en': 'BSN',
      'tl': 'BSN',
    },
    '8sawao58': {
      'en': 'BSPharm',
      'tl': 'BSPharm',
    },
    'ze23bivw': {
      'en': 'BSCS',
      'tl': 'BSCS',
    },
    '7yui2p4f': {
      'en': 'BSIT',
      'tl': 'BSIT',
    },
    'kn1yo7g3': {
      'en': 'BSCrim',
      'tl': 'BSCrim',
    },
    'sjdj876w': {
      'en': 'Select your course',
      'tl': 'Piliin ang iyong kurso',
    },
    'tzydmubw': {
      'en': 'Select your course',
      'tl': 'Piliin ang iyong kurso',
    },
    '9mxebxg6': {
      'en': 'Password',
      'tl': 'Password',
    },
    '98xgfwp0': {
      'en': 'Password',
      'tl': 'Password',
    },
    'o94crmnm': {
      'en': 'Confirm Password',
      'tl': 'Kumpirmahin ang Password',
    },
    'ryvex3n6': {
      'en': 'Confirm Password',
      'tl': 'Kumpirmahin ang Password',
    },
    '8y8o9d2j': {
      'en': 'Cancel',
      'tl': 'Kanselahin',
    },
    'kg6a3qw9': {
      'en': 'Create',
      'tl': 'Lumikha',
    },
    '8scj7jt5': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    'lvnt6glb': {
      'en': 'Insitutional Email',
      'tl': 'Institusyonal na Email',
    },
    '3amlviza': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    '1no8rdpm': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'hljz3rei': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    'jojk7jzu': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'e95ujhnw': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    '3owby810': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'd6iglhg8': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    'o9bw24wr': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'pw3oqd6c': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    '7chm6ivw': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'yt201d4d': {
      'en': 'Field is required',
      'tl': 'Kinakailangan ang field',
    },
    'tvq2ixu0': {
      'en': 'Please choose an option from the dropdown',
      'tl': 'Mangyaring pumili ng opsyon mula sa dropdown',
    },
    'bvyqayap': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // EditProfile
  {
    '53n21ey6': {
      'en': 'Notification',
      'tl': '',
    },
    'kobcvs8g': {
      'en': '1',
      'tl': '',
    },
    '2fjpa4w8': {
      'en': 'Search',
      'tl': '',
    },
    'dintdt3z': {
      'en': 'Notes Storage',
      'tl': '',
    },
    '2md7jubi': {
      'en': 'Forums',
      'tl': '',
    },
    'rn6gho5d': {
      'en': 'Quiz ',
      'tl': '',
    },
    's3b1k59v': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    '13bx22db': {
      'en': 'Logout',
      'tl': '',
    },
    '2u7sxx1o': {
      'en': 'Edit Profile',
      'tl': 'Ibahin ang profile',
    },
    'a15yqjvl': {
      'en': 'Facebook Profile Link',
      'tl': 'Link ng Profile sa Facebook',
    },
    'qp3tidrm': {
      'en': 'Paste your Facebook link here',
      'tl': 'I-paste ang iyong link sa Facebook dito',
    },
    'n61uyhla': {
      'en': 'LinkedIn Profile Link',
      'tl': 'Link ng Profile ng LinkedIn',
    },
    'oqd7xcgb': {
      'en': 'Paste your Facebook link here',
      'tl': 'I-paste ang iyong link sa Facebook dito',
    },
    '6r5h99fy': {
      'en': 'GitHub Profile Link',
      'tl': 'Link ng Profile ng GitHub',
    },
    'dd87gt4q': {
      'en': 'Paste your GitHub link here',
      'tl': 'I-paste ang iyong link sa GitHub dito',
    },
    'wl73sfyh': {
      'en': 'Personal Website Link',
      'tl': 'Link ng Personal na Website',
    },
    'r07bh8k0': {
      'en': 'Paste your website link here',
      'tl': 'I-paste ang link ng iyong website dito',
    },
    'ogoiqmzl': {
      'en': 'Cancel',
      'tl': 'Kanselahin',
    },
    'ixixrga3': {
      'en': 'Save Changes',
      'tl': 'I-save ang mga pagbabago',
    },
    '9o5gq3w3': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    'ahjclgey': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    'odbh1sns': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    '2dc93m2o': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    'kc4xk6ow': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    '8if40ko3': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'wf2i39jp': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    '2f9ktndt': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    '74j9z2s6': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    'nrdkunr6': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'iqpf55wu': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    '90hponm3': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // ForgotPassword
  {
    'ph2hcckl': {
      'en': 'Recover Your Account',
      'tl': 'Bawiin ang Iyong Account',
    },
    'cc8xpf2e': {
      'en':
          'Forgot your password? Don\'t worry let\'s retrieve it back using your institutional mail.',
      'tl':
          'Nakalimutan ang iyong password? Huwag mag-alala, bawiin natin ito gamit ang iyong institutional na mail.',
    },
    '1z11j854': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    'o3racek2': {
      'en': 'Institutional Email',
      'tl': 'Institusyonal na Email',
    },
    'n9u7k7dc': {
      'en': 'Send Verification',
      'tl': 'Ipadala ang Pagpapatunay',
    },
    '2ysg9vqw': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // Feedback
  {
    'trdpfh94': {
      'en': 'Feedback List',
      'tl': '',
    },
    'dwa1o48t': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // UserManagement
  {
    'y324fxp8': {
      'en': 'User management',
      'tl': '',
    },
    'yvb4t8qi': {
      'en': '',
      'tl': 'Label dito...',
    },
    'ivwqpj74': {
      'en': 'Search here....',
      'tl': '',
    },
    'j53db4nn': {
      'en': 'Instructor',
      'tl': 'Tagapagturo',
    },
    'h75sm7xx': {
      'en': 'Student',
      'tl': 'Mag-aaral',
    },
    'pilhbbfa': {
      'en': 'No Filter',
      'tl': 'Walang Filter',
    },
    'xnnwx5z8': {
      'en': 'Please select...',
      'tl': 'Pakipili...',
    },
    '55clulkh': {
      'en': 'Search for an item...',
      'tl': 'Maghanap ng item...',
    },
    'ty07fv2j': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // Analytics
  {
    'wmpajtzb': {
      'en': 'Engagement and Notes Analytics',
      'tl': '',
    },
    'pa7k4zp4': {
      'en': 'Engagement Analytics',
      'tl': '',
    },
    'bvw5fwrn': {
      'en': 'Student Program Distribution',
      'tl': '',
    },
    'jygwall2': {
      'en': 'Student to Instructor Ratio',
      'tl': '',
    },
    'xthi3fz2': {
      'en': 'Number of Logins',
      'tl': '',
    },
    'v95hffjr': {
      'en': 'Weeks',
      'tl': '',
    },
    'rvahb01e': {
      'en': 'Number of Logins',
      'tl': '',
    },
    'm1o9y3w2': {
      'en': 'Total App Engagement',
      'tl': '',
    },
    'i8hlph1s': {
      'en': 'Month',
      'tl': '',
    },
    'q8r1hi3d': {
      'en': 'Retention Rate',
      'tl': '',
    },
    '889rauj0': {
      'en': 'Notes Analytics',
      'tl': '',
    },
    'lvrumyco': {
      'en': 'Subject Notes Distribution',
      'tl': '',
    },
    'gm7vkzdq': {
      'en': 'Uploads per Month',
      'tl': '',
    },
    '85kwhcdu': {
      'en': 'Month',
      'tl': '',
    },
    'ylwlli1v': {
      'en': 'Number of Uploads',
      'tl': '',
    },
    '83mw9kam': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // NotifPage
  {
    '12c5ij8e': {
      'en': 'Notification',
      'tl': '',
    },
    '0ansb78h': {
      'en': '1',
      'tl': '',
    },
    'edkj0lna': {
      'en': 'Search',
      'tl': '',
    },
    'u9s9xeal': {
      'en': 'Notes Storage',
      'tl': '',
    },
    'nw21e8h7': {
      'en': 'Forums',
      'tl': '',
    },
    'gefq0lrt': {
      'en': 'Quiz ',
      'tl': '',
    },
    'ke8vvrmn': {
      'en': 'Pomodoro Timer',
      'tl': '',
    },
    'tm8madp9': {
      'en': 'Logout',
      'tl': '',
    },
    '6xxavgp1': {
      'en': 'Notifications',
      'tl': 'Mga abiso',
    },
    '9kjbafm7': {
      'en': 'Mark as Read',
      'tl': '',
    },
    '70mlyjc4': {
      'en': 'Profile',
      'tl': 'Profile',
    },
    'nefn05cp': {
      'en': 'Menu',
      'tl': 'Menu',
    },
    'naqnhct1': {
      'en': 'Home                                            ',
      'tl': 'Bahay',
    },
    'mmo73yll': {
      'en':
          'Notifications                                                       ',
      'tl': 'Mag-sign Out',
    },
    'rhspuj5u': {
      'en': 'Search                                      ',
      'tl': 'Maghanap',
    },
    '8od2x43t': {
      'en': 'Notes Storage                                      ',
      'tl': 'Imbakan ng Mga Tala',
    },
    'lzcrvubu': {
      'en': 'Forum (Q&A)                           ',
      'tl': 'Forum (Q&A)',
    },
    'f0bf4tah': {
      'en': 'Quizzes                                  ',
      'tl': 'Mga pagsusulit',
    },
    'hri955pv': {
      'en': 'Pomodoro Timer                                      ',
      'tl': 'Timer ng Pomodoro',
    },
    'bneyb2o7': {
      'en': 'Sign Out                                                 ',
      'tl': 'Mag-sign Out',
    },
    'lx93rknz': {
      'en': 'Need Help? Give us your feedback.',
      'tl': '',
    },
    '5nbanpiw': {
      'en': 'Home',
      'tl': 'Bahay',
    },
  },
  // EditPP
  {
    'dh9h7phd': {
      'en': 'Change Profile Picture',
      'tl': 'Baguhin ang Larawan sa Profile',
    },
    'a21tvu9n': {
      'en': 'Upload Image',
      'tl': 'Mag-upload ng Larawan',
    },
    'ute0ox9z': {
      'en': 'Save Changes',
      'tl': 'I-save ang mga pagbabago',
    },
  },
  // AddPost
  {
    'dvhgq2qi': {
      'en': 'Create Post',
      'tl': 'Gumawa ng Post',
    },
    '60g45no6': {
      'en': 'Title',
      'tl': 'Pamagat',
    },
    'ou11l4c3': {
      'en': 'Post contents here....',
      'tl': 'Mag-post ng nilalaman dito....',
    },
    'qgfz0xhi': {
      'en': 'Tags',
      'tl': 'Mga tag',
    },
    'zh3tqgiy': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'xqyxptrt': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    'kg2exv2p': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    'uw2xxqrf': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    's7u6zy7g': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    'bi3d7i4h': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    'ppx7p6kg': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    'rprxa8nt': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'olosfkzj': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'lcfdsyri': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    't7yb5mid': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    'v8vih9ua': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    '5zqny7q5': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    '6e6v7fda': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    'u4wfutf1': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    '386gewrc': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    'bai72cae': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    'q7qqmz79': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    '2ns8bkzq': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    'kixmlgla': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    'z99sjubu': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'tnlcca1e': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    'l4n8rjo7': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    'h6kuufta': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    'ro94p9gk': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    'o7v8nra7': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    '4x96vajc': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    'ksi4urkl': {
      'en': 'Remove Tag',
      'tl': 'Alisin ang Tag',
    },
    '2cuvgrlp': {
      'en': 'Please select...',
      'tl': 'Pakipili...',
    },
    'uy28ekkf': {
      'en': 'Search for a tag...',
      'tl': 'Maghanap ng tag...',
    },
    'tcysjuoe': {
      'en': 'Upload Image/s',
      'tl': 'Mag-upload ng Imahe',
    },
    'ln1118jk': {
      'en': 'Cancel',
      'tl': 'Kanselahin',
    },
    '9fiah3lc': {
      'en': 'Submit Post',
      'tl': 'Isumite ang Post',
    },
  },
  // UploadNotes
  {
    '24wpz9iq': {
      'en': 'Upload Note',
      'tl': 'Mag-upload ng Tala',
    },
    '1yiem2tw': {
      'en': 'Attach File',
      'tl': 'Maglakip ng file',
    },
    'n5fxnwkz': {
      'en': 'Filename',
      'tl': 'Filename',
    },
    'dc996uai': {
      'en': 'Enter Filename Here...',
      'tl': 'Ilagay ang Filename Dito...',
    },
    '0cuuygs7': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'wr0w9s2n': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    'jncgt86a': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    '40jfx86n': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    'jtu7jpeq': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    'ob47a7xc': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    'ebalwdrz': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    'ridlojmf': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'bf9dxkvx': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'r9sz9pww': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    'h7suk807': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    'henq58ql': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    'niciegyq': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    'cab77af6': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    '6xwcoss6': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    'vzm1xoa0': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    'cuyymt0s': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    'kzvyxrjs': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    'j9aennm4': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    'z0xswhng': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    '5k4vz2li': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'rok1kzta': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    '4r2gyjol': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    '1p5i6lch': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    '3y5ykqbx': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    'r8lz053q': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    'w538hkr3': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    '5q925gyd': {
      'en': '#SSP031',
      'tl': '#SSP031',
    },
    'v08scq8c': {
      'en': '#ECE254',
      'tl': '#ECE254',
    },
    '8huof63c': {
      'en': '#ECE204',
      'tl': '#ECE204',
    },
    'p51gwe4o': {
      'en': '#CPE264',
      'tl': '#CPE264',
    },
    'j7hbxeiv': {
      'en': '#CPE262',
      'tl': '#CPE262',
    },
    '9v127yum': {
      'en': '#CPE234',
      'tl': '#CPE234',
    },
    'cjquvo7h': {
      'en': '#CPE232',
      'tl': '#CPE232',
    },
    'psq6c0kh': {
      'en': '#CPE330',
      'tl': '#CPE330',
    },
    'nedtpegp': {
      'en': '#CPE340',
      'tl': '#CPE340',
    },
    'j6ibp5yk': {
      'en': '#ES038',
      'tl': '#ES038',
    },
    'jll9zr6h': {
      'en': '#CPEPE361/SD',
      'tl': '#CPEPE361/SD',
    },
    'rtu7218y': {
      'en': '#CPE381',
      'tl': '#CPE381',
    },
    'b18st1f4': {
      'en': '#CPE363',
      'tl': '#CPE363',
    },
    'njowtnzv': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    '2cx5kirf': {
      'en': '#CPE335',
      'tl': '#CPE335',
    },
    '5cpg97yz': {
      'en': '#CPE333',
      'tl': '#CPE333',
    },
    'q21bsipw': {
      'en': '#CPE331',
      'tl': '#CPE331',
    },
    '3k623hgt': {
      'en': 'Tags...',
      'tl': 'Mga tag...',
    },
    'hp907fpv': {
      'en': 'Search Tag....',
      'tl': 'Maghanap ng Tag....',
    },
    'dvu6ivys': {
      'en': 'Cancel',
      'tl': 'Kanselahin',
    },
    'xbbzdr4a': {
      'en': 'Upload Note',
      'tl': 'Mag-upload ng Tala',
    },
  },
  // OpenPost
  {
    '7poyqu4x': {
      'en': 'Comments',
      'tl': 'Mga komento',
    },
    'cy5k3rf0': {
      'en': 'Add Comment',
      'tl': 'Magdagdag ng Komento',
    },
    'qadqrbt9': {
      'en': 'Comment here..',
      'tl': 'Comment dito..',
    },
    'vtp6vcws': {
      'en': 'Add Comment',
      'tl': 'Magdagdag ng Komento',
    },
  },
  // ViewNote
  {
    'kk37r3rs': {
      'en': 'Back',
      'tl': 'Bumalik',
    },
    'wkw58eex': {
      'en': 'Download PDF',
      'tl': 'Mag-download ng PDF',
    },
  },
  // viewProfile
  {
    'wgm9oern': {
      'en': 'Followers',
      'tl': 'Mga tagasunod',
    },
    'rqb2x6dy': {
      'en': 'Following',
      'tl': 'Sumusunod',
    },
    's6y3t1me': {
      'en': 'Unfollow',
      'tl': 'I-unfollow',
    },
    'r0kwf1cz': {
      'en': 'Follow',
      'tl': 'Sundin',
    },
    'ziyku0ef': {
      'en': 'Facebook',
      'tl': 'Facebook',
    },
    'mngnrfw1': {
      'en': 'LinkedIn',
      'tl': 'LinkedIn',
    },
    'go0f6qrn': {
      'en': 'GitHub',
      'tl': 'GitHub',
    },
    'axxyvt9f': {
      'en': 'Personal Website',
      'tl': 'Personal na Website',
    },
    '0j80a7yo': {
      'en': 'User Timeline',
      'tl': 'Timeline ng User',
    },
  },
  // LeaderBoards
  {
    'kxdmcwp1': {
      'en': 'TekNotes Leaderboards',
      'tl': '',
    },
    '1wvfjy9o': {
      'en': 'Students',
      'tl': '',
    },
    '7x01j94h': {
      'en': 'Instructors',
      'tl': '',
    },
  },
  // Feedbackform
  {
    'mfgx5yl1': {
      'en': 'Feedback',
      'tl': 'Mag-upload ng Tala',
    },
    'pvncm9j2': {
      'en': 'Title',
      'tl': 'Pamagat',
    },
    'k9aiyx29': {
      'en': 'Concern details here...',
      'tl': 'Mag-post ng nilalaman dito....',
    },
    'qbru886e': {
      'en': 'Cancel',
      'tl': 'Kanselahin',
    },
    'q5s3xgx6': {
      'en': 'Submit Post',
      'tl': 'Isumite ang Post',
    },
  },
  // UploadQuiz
  {
    '8dp0aaz3': {
      'en': 'Create Quiz',
      'tl': 'Gumawa ng Post',
    },
    'lsl6r4a6': {
      'en': 'Quiz Title',
      'tl': 'Pamagat',
    },
    'nz974k3f': {
      'en': 'Tags',
      'tl': 'Mga tag',
    },
    '4xa1crg1': {
      'en': '#STS031',
      'tl': '#STS031',
    },
    'aufcsn08': {
      'en': '#PSYCH031',
      'tl': '#PSYCH031',
    },
    'puxxahxe': {
      'en': '#PE103',
      'tl': '#PE103',
    },
    'madsfq1s': {
      'en': '#NSTP111',
      'tl': '#NSTP111',
    },
    '89qrtigm': {
      'en': '#MATH137',
      'tl': '#MATH137',
    },
    '7y1kqbde': {
      'en': '#MATH031',
      'tl': '#MATH031',
    },
    'rsn1ruhm': {
      'en': '#CPE361',
      'tl': '#CPE361',
    },
    'qkrt45lj': {
      'en': '#CPE131',
      'tl': '#CPE131',
    },
    'd3u29vc1': {
      'en': '#CHEM181',
      'tl': '#CHEM181',
    },
    'g68t817w': {
      'en': '#CHEM131',
      'tl': '#CHEM131',
    },
    'd6p9d587': {
      'en': '#PHYS182',
      'tl': '#PHYS182',
    },
    '2l16g4ec': {
      'en': '#PHYS132',
      'tl': '#PHYS132',
    },
    '1d768sva': {
      'en': '#PE104',
      'tl': '#PE104',
    },
    'nisdl8nm': {
      'en': '#NSTP112',
      'tl': '#NSTP112',
    },
    'goxnfgso': {
      'en': '#MATH138',
      'tl': '#MATH138',
    },
    'v40tzcic': {
      'en': '#CPE162',
      'tl': '#CPE162',
    },
    'h7frqz2u': {
      'en': '#CPE132',
      'tl': '#CPE132',
    },
    '802k8ihg': {
      'en': '#SOCSCI031',
      'tl': '#SOCSCI031',
    },
    'c4cx2yqn': {
      'en': '#ENGL031',
      'tl': '#ENGL031',
    },
    'cy42mk6f': {
      'en': '#PHILO031',
      'tl': '#PHILO031',
    },
    'by3l5471': {
      'en': '#HUM031',
      'tl': '#HUM031',
    },
    'my8q6o8x': {
      'en': '#ES031',
      'tl': '#ES031',
    },
    'v835i1pe': {
      'en': '#ENGL014',
      'tl': '#ENGL014',
    },
    'qvqg1zru': {
      'en': '#EE281',
      'tl': '#EE281',
    },
    'gwrqzmr1': {
      'en': '#EE231',
      'tl': '#EE231',
    },
    '5i1vzscd': {
      'en': '#CPE261',
      'tl': '#CPE261',
    },
    'ppqewgac': {
      'en': '#ES083',
      'tl': '#ES083',
    },
    '0ef2ade8': {
      'en': 'Remove Tag',
      'tl': 'Alisin ang Tag',
    },
    'au3mjul3': {
      'en': 'Please select...',
      'tl': 'Pakipili...',
    },
    '7qqsnljd': {
      'en': 'Search for a tag...',
      'tl': 'Maghanap ng tag...',
    },
    '8r151sd1': {
      'en': 'Quiz Contents',
      'tl': '',
    },
    'wpx2g5uk': {
      'en': 'Front Page Content',
      'tl': '',
    },
    'm16ai9i1': {
      'en': 'Back Page Content',
      'tl': '',
    },
    'irps0eay': {
      'en': 'Add Question',
      'tl': '',
    },
    'r33yii23': {
      'en': 'Review Contents',
      'tl': 'Kanselahin',
    },
    '36wm835e': {
      'en': 'Cancel',
      'tl': 'Kanselahin',
    },
    '8wlp3gks': {
      'en': 'Submit Quiz',
      'tl': 'Isumite ang Post',
    },
  },
  // ViewQuiz
  {
    'v6n55gye': {
      'en': 'Back',
      'tl': 'Bumalik',
    },
  },
  // Followers
  {
    'm0at4aml': {
      'en': 'Followers',
      'tl': 'Baguhin ang Larawan sa Profile',
    },
    'ecnxpp9f': {
      'en': 'Search',
      'tl': '',
    },
  },
  // Following
  {
    'efxldkoz': {
      'en': 'Following',
      'tl': 'Baguhin ang Larawan sa Profile',
    },
    'xo9m49aj': {
      'en': 'Search',
      'tl': '',
    },
  },
  // user_following
  {
    'gryqroq8': {
      'en': 'Unfollow',
      'tl': '',
    },
  },
  // user_follower
  {
    'wmbslax4': {
      'en': 'Remove',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'pzpe7yum': {
      'en': '',
      'tl': '',
    },
    '495uav11': {
      'en': '',
      'tl': '',
    },
    'fl947o43': {
      'en': '',
      'tl': '',
    },
    'kbbyt9oz': {
      'en': '',
      'tl': '',
    },
    'mrem8dh2': {
      'en': '',
      'tl': '',
    },
    'lbih3zyz': {
      'en': '',
      'tl': '',
    },
    'qocwmb3f': {
      'en': '',
      'tl': '',
    },
    '449wpzwe': {
      'en': '',
      'tl': '',
    },
    '2a59pzvi': {
      'en': '',
      'tl': '',
    },
    'fo1gxsfx': {
      'en': '',
      'tl': '',
    },
    'alv6jora': {
      'en': '',
      'tl': '',
    },
    'w7x049vv': {
      'en': '',
      'tl': '',
    },
    'qiqzweto': {
      'en': '',
      'tl': '',
    },
    'trwtf6az': {
      'en': '',
      'tl': '',
    },
    'a3t4j6vh': {
      'en': '',
      'tl': '',
    },
    'wdb0nusb': {
      'en': '',
      'tl': '',
    },
    '2108a0sn': {
      'en': '',
      'tl': '',
    },
    'wqeyyawq': {
      'en': '',
      'tl': '',
    },
    'f7gt246o': {
      'en': '',
      'tl': '',
    },
    'ylyxcbb9': {
      'en': '',
      'tl': '',
    },
    'mmhz8rcc': {
      'en': '',
      'tl': '',
    },
    'x6m9dc99': {
      'en': '',
      'tl': '',
    },
    'zifnfs5q': {
      'en': '',
      'tl': '',
    },
    'lhd15nzf': {
      'en': '',
      'tl': '',
    },
    '74pl686b': {
      'en': '',
      'tl': '',
    },
    'aijgisdd': {
      'en': '',
      'tl': '',
    },
    'ppfkygvg': {
      'en': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
