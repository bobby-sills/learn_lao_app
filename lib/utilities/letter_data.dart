class LetterData {
  static const List<String> consonantOrder = [
    'ກ', // g/k sound
    'ງ', // visually distinct spacer
    'ຂ', // g/k sound (pair with ກ but spaced)
    'ຈ', // visually distinct spacer
    'ຄ', // g/k sound (final of this group)
    'ສ', // visually distinct spacer
    'ຟ', // f/ph sound
    'ດ', // visually distinct spacer
    'ຝ', // f/ph sound (pair with ຟ)
    'ນ', // visually distinct spacer
    'ປ', // p/bp sound
    'ຣ', // visually distinct spacer
    'ບ', // p/bp sound (pair with ປ)
    'ລ', // visually distinct spacer
    'ພ', // p/bp sound (final of this group)
    'ວ', // visually distinct spacer
    'ຕ', // t sound
    'ຊ', // visually distinct spacer
    'ທ', // t sound (pair with ຕ)
    'ມ', // visually distinct spacer
    'ຖ', // t sound (final of this group)
    'ອ', // visually distinct spacer
    'ຍ', // y/ny sound
    'ຜ', // visually distinct spacer
    'ຢ', // y/ny sound (pair with ຍ)
    'ຫ', // h sound
    'ຮ', // h sound (pair with ຫ but spaced at end)
  ];

  static const Map<String, String> lettersToWords = {
    'ກ': 'ໄກ່',
    'ຂ': 'ໄຂ່',
    'ຄ': 'ຄວາຍ',
    'ງ': 'ງູ',
    'ຈ': 'ຈອກ',
    'ສ': 'ເສືອ',
    'ຊ': 'ຊ້າງ',
    'ຍ': 'ຍຸງ',
    'ດ': 'ເດັກ',
    'ຕ': 'ຕາ',
    'ຖ': 'ຖົງ',
    'ທ': 'ທຸງ',
    'ນ': 'ນົກ',
    'ບ': 'ແບ້',
    'ປ': 'ປາ',
    'ຜ': 'ເຜິ້ງ',
    'ຝ': 'ຝົນ',
    'ພ': 'ພູ',
    'ຟ': 'ໄຟ',
    'ມ': 'ແມວ',
    'ຢ': 'ຢາ',
    'ຣ': 'ຣະຄັງ',
    'ລ': 'ລີງ',
    'ວ': 'ວີ',
    'ຫ': 'ຫ່ານ',
    'ອ': 'ອື່ງ',
    'ຮ': 'ເຮືອ',
  };

  static const Map<String, String> laoToRomanization = {
    'ກ': 'ko',
    'ຂ': 'kho sung',
    'ຄ': 'kho tam',
    'ງ': 'ngo',
    'ຈ': 'co',
    'ສ': 'so sung',
    'ຊ': 'so tam',
    'ຍ': 'nyo',
    'ດ': 'do',
    'ຕ': 'to',
    'ຖ': 'tho sung',
    'ທ': 'tho tam',
    'ນ': 'no',
    'ບ': 'bo',
    'ປ': 'po',
    'ຜ': 'pho sung',
    'ຝ': 'fo tam',
    'ພ': 'pho tam',
    'ຟ': 'fo sung',
    'ມ': 'mo',
    'ຢ': 'yo',
    'ຣ': 'lo ling',
    'ລ': 'lo loot',
    'ວ': 'wo',
    'ຫ': 'ho sung',
    'ອ': 'o',
    'ຮ': 'ho tam',
  };

  static const Map<String, String> romanizationToLao = {
    "ko": "ກ",
    "kho sung": "ຂ",
    "kho tam": "ຄ",
    "ngo": "ງ",
    "co": "ຈ",
    "so sung": "ສ",
    "so tam": "ຊ",
    "nyo": "ຍ",
    "do": "ດ",
    "to": "ຕ",
    "tho sung": "ຖ",
    "tho tam": "ທ",
    "no": "ນ",
    "bo": "ບ",
    "po": "ປ",
    "pho sung": "ຜ",
    "fo tam": "ຝ",
    "pho tam": "ພ",
    "fo sung": "ຟ",
    "mo": "ມ",
    "yo": "ຢ",
    "lo ling": "ຣ",
    "lo loot": "ລ",
    "wo": "ວ",
    "ho sung": "ຫ",
    "o": "ອ",
    "ho tam": "ຮ",
  };

  static const String vowelPlaceholder = '◌';

  static const List<String> vowelsIndices = [
    'ເ◌ຍ, ◌ຽ',
    'ເ◌ືອ',
    '◌ົວ',
    'ໄ◌',
    'ໃ◌',
    'ເ◌ົາ',
    '◌ຳ',
    '◌ອຍ',
    '◌ວຍ',
    '◌ິ',
    '◌ີ',
    '◌ຶ',
    '◌ື',
    '◌ຸ',
    '◌ູ',
    'ເ◌ິ',
    'ເ◌ີ',
    '◌ະ, ◌ັ',
    '◌າ',
    'ເ◌ະ',
    'ເ◌',
    'ແ◌ະ, ແ◌ັ',
    'ແ◌',
    'ໂ◌ະ, ◌ົ',
    'ໂ◌',
    'ເ◌າະ, ◌ັອ',
    '◌ໍ',
  ];
}
