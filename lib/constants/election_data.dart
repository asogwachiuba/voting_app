import 'package:voting_app/constants/keys.dart';

class ElectionData {
  /// Take note the order of the lists of states in [states] should be the
  /// same order as the list of states in [pollingUnits]

  // Presidential results
  static const Map<String, int> result = {
    Keys.pdp: 0,
    Keys.apc: 0,
    Keys.lp: 0,
    Keys.apga: 0,
    Keys.a: 0,
    Keys.aa: 0,
    Keys.adp: 0,
    Keys.app: 0,
    Keys.aac: 0,
    Keys.adc: 0,
    Keys.apm: 0,
    Keys.bp: 0,
    Keys.nrm: 0,
    Keys.nnpp: 0,
    Keys.prp: 0,
    Keys.sdp: 0,
    Keys.ypp: 0,
    Keys.zlp: 0,
  };

  // OR - users profile should contain bool param to signify if they have voted for each of the election category
  //local government
  static const Map<String, dynamic> localGovernmentCandidates = {
    Keys.pdp: {
      Keys.party: "Peoples Democratic Party",
      Keys.candidate: "Alhaji Atiku Abubakar",
      "acronym": Keys.pdp
    },
    Keys.apc: {
      Keys.party: "All Progressives Congress",
      Keys.candidate: "Asiwaju Bola Tinubu",
      "acronym": Keys.apc,
    },
    Keys.lp: {
      Keys.party: "Labour Party",
      Keys.candidate: "Mr Peter Obi",
      "acronym": Keys.lp,
    },
    Keys.apga: {
      Keys.party: "All Progressives Grand Alliance",
      Keys.candidate: "Professor Peter Umeadi",
      "acronym": Keys.apga,
    },
    Keys.a: {
      Keys.party: "Accord",
      Keys.candidate: "Professor Christopher Imumulen",
      "acronym": Keys.a,
    },
    Keys.aa: {
      Keys.party: "Action Alliance",
      Keys.candidate: "ALMUSTAPHA HAMZA",
      "acronym": Keys.aa,
    },
    Keys.adp: {
      Keys.party: "Action Democratic Party",
      Keys.candidate: "SANI YABAGI YUSUF",
      "acronym": Keys.adp,
    },
    Keys.app: {
      Keys.party: "Action Peoples Party",
      Keys.candidate: "NNADI CHARLES OSITA",
      "acronym": Keys.app,
    },
    Keys.aac: {
      Keys.party: "African Action Congress",
      Keys.candidate: "Omoyele Sowore",
      "acronym": Keys.aac,
    },
    Keys.adc: {
      Keys.party: "African Democratic Congress",
      Keys.candidate: "Dumebi Kachikwu",
      "acronym": Keys.adc,
    },
    Keys.apm: {
      Keys.party: "Allied Peoples Movement",
      Keys.candidate: "Yusuf Mamman Dan Talle",
      "acronym": Keys.apm,
    },
    Keys.bp: {
      Keys.party: "Boot Party",
      Keys.candidate: "Adenuga Sunday Oluwafemi",
      "acronym": Keys.bp,
    },
    Keys.nrm: {
      Keys.party: "National Rescue Movement",
      Keys.candidate: "Osakwe Felix Johnson",
      "acronym": Keys.nrm,
    },
    Keys.nnpp: {
      Keys.party: "New Nigeria Peoples Party",
      Keys.candidate: "Mr Rabiu Musa Kwankwaso",
      "acronym": Keys.nnpp,
    },
    Keys.prp: {
      Keys.party: "Peoples Redemption Party",
      Keys.candidate: "Mr Kola Abiola",
      "acronym": Keys.prp,
    },
    Keys.sdp: {
      Keys.party: "Social Democratic Party",
      Keys.candidate: "Prince Adewole Adebayo",
      "acronym": Keys.sdp,
    },
    Keys.ypp: {
      Keys.party: "Young Progressive Party",
      Keys.candidate: "Prince Malik Ado-Ibrahim",
      "acronym": Keys.ypp,
    },
    Keys.zlp: {
      Keys.party: "Zenith Labour Party",
      Keys.candidate: "Nwanyanwu Daniel Daberechukwu",
      "acronym": Keys.zlp,
    }
  };

  // state
  static const Map<String, dynamic> stateCandidates = {
    Keys.pdp: {
      Keys.party: "Peoples Democratic Party",
      Keys.candidate: "Abdul-Azeez Olajide Adediran",
      "acronym": Keys.pdp
    },
    Keys.apc: {
      Keys.party: "All Progressives Congress",
      Keys.candidate: "Babajide Sanwo-Olu",
      "acronym": Keys.apc,
    },
    Keys.lp: {
      Keys.party: "Labour Party",
      Keys.candidate: "Gbadebo Rhodes-Vivour",
      "acronym": Keys.lp,
    },
    Keys.apga: {
      Keys.party: "All Progressives Grand Alliance",
      Keys.candidate: "Gregory Ibe",
      "acronym": Keys.apga,
    },
    Keys.a: {
      Keys.party: "Accord",
      Keys.candidate: "Professor Christopher Imumulen",
      "acronym": Keys.a,
    },
    Keys.aa: {
      Keys.party: "Action Alliance",
      Keys.candidate: "ALMUSTAPHA HAMZA",
      "acronym": Keys.aa,
    },
    Keys.adp: {
      Keys.party: "Action Democratic Party",
      Keys.candidate: "SANI YABAGI YUSUF",
      "acronym": Keys.adp,
    },
    Keys.app: {
      Keys.party: "Action Peoples Party",
      Keys.candidate: "NNADI CHARLES OSITA",
      "acronym": Keys.app,
    },
    Keys.aac: {
      Keys.party: "African Action Congress",
      Keys.candidate: "Omoyele Sowore",
      "acronym": Keys.aac,
    },
    Keys.adc: {
      Keys.party: "African Democratic Congress",
      Keys.candidate: "Olubiyi Otegbeye",
      "acronym": Keys.adc,
    },
    Keys.apm: {
      Keys.party: "Allied Peoples Movement",
      Keys.candidate: "Yusuf Mamman Dan Talle",
      "acronym": Keys.apm,
    },
    Keys.bp: {
      Keys.party: "Boot Party",
      Keys.candidate: "Adenuga Sunday Oluwafemi",
      "acronym": Keys.bp,
    },
    Keys.nrm: {
      Keys.party: "National Rescue Movement",
      Keys.candidate: "Osakwe Felix Johnson",
      "acronym": Keys.nrm,
    },
    Keys.nnpp: {
      Keys.party: "New Nigeria Peoples Party",
      Keys.candidate: "Abba Kabir Yusuf",
      "acronym": Keys.nnpp,
    },
    Keys.prp: {
      Keys.party: "Peoples Redemption Party",
      Keys.candidate: "Mr Kola Abiola",
      "acronym": Keys.prp,
    },
    Keys.sdp: {
      Keys.party: "Social Democratic Party",
      Keys.candidate: "Prince Adewole Adebayo",
      "acronym": Keys.sdp,
    },
    Keys.ypp: {
      Keys.party: "Young Progressive Party",
      Keys.candidate: "Prince Malik Ado-Ibrahim",
      "acronym": Keys.ypp,
    },
    Keys.zlp: {
      Keys.party: "Zenith Labour Party",
      Keys.candidate: "Nwanyanwu Daniel Daberechukwu",
      "acronym": Keys.zlp,
    }
  };

  // presidential candidates
  static const Map<String, dynamic> presidentialCandidates = {
    Keys.pdp: {
      Keys.party: "Peoples Democratic Party",
      Keys.candidate: "Peter Mbah",
      "acronym": Keys.pdp
    },
    Keys.apc: {
      Keys.party: "All Progressives Congress",
      Keys.candidate: "Uche Nnaji",
      "acronym": Keys.apc,
    },
    Keys.lp: {
      Keys.party: "Labour Party",
      Keys.candidate: "Chijioke Edeoga",
      "acronym": Keys.lp,
    },
    Keys.apga: {
      Keys.party: "All Progressives Grand Alliance",
      Keys.candidate: "Frank Nweke",
      "acronym": Keys.apga,
    },
    Keys.a: {
      Keys.party: "Accord",
      Keys.candidate: "Professor Christopher Imumulen",
      "acronym": Keys.a,
    },
    Keys.aa: {
      Keys.party: "Action Alliance",
      Keys.candidate: "ALMUSTAPHA HAMZA",
      "acronym": Keys.aa,
    },
    Keys.adp: {
      Keys.party: "Action Democratic Party",
      Keys.candidate: "SANI YABAGI YUSUF",
      "acronym": Keys.adp,
    },
    Keys.app: {
      Keys.party: "Action Peoples Party",
      Keys.candidate: "NNADI CHARLES OSITA",
      "acronym": Keys.app,
    },
    Keys.aac: {
      Keys.party: "African Action Congress",
      Keys.candidate: "Omoyele Sowore",
      "acronym": Keys.aac,
    },
    Keys.adc: {
      Keys.party: "African Democratic Congress",
      Keys.candidate: "Dumebi Kachikwu",
      "acronym": Keys.adc,
    },
    Keys.apm: {
      Keys.party: "Allied Peoples Movement",
      Keys.candidate: "Yusuf Mamman Dan Talle",
      "acronym": Keys.apm,
    },
    Keys.bp: {
      Keys.party: "Boot Party",
      Keys.candidate: "Adenuga Sunday Oluwafemi",
      "acronym": Keys.bp,
    },
    Keys.nrm: {
      Keys.party: "National Rescue Movement",
      Keys.candidate: "Osakwe Felix Johnson",
      "acronym": Keys.nrm,
    },
    Keys.nnpp: {
      Keys.party: "New Nigeria Peoples Party",
      Keys.candidate: "Mr Rabiu Musa Kwankwaso",
      "acronym": Keys.nnpp,
    },
    Keys.prp: {
      Keys.party: "Peoples Redemption Party",
      Keys.candidate: "Mr Kola Abiola",
      "acronym": Keys.prp,
    },
    Keys.sdp: {
      Keys.party: "Social Democratic Party",
      Keys.candidate: "Prince Adewole Adebayo",
      "acronym": Keys.sdp,
    },
    Keys.ypp: {
      Keys.party: "Young Progressive Party",
      Keys.candidate: "Prince Malik Ado-Ibrahim",
      "acronym": Keys.ypp,
    },
    Keys.zlp: {
      Keys.party: "Zenith Labour Party",
      Keys.candidate: "Nwanyanwu Daniel Daberechukwu",
      "acronym": Keys.zlp,
    }
  };

  // States
  static const List<String> states = [
    "Lagos",
    "Kano",
    "Anambra",
    "Enugu",
    "Abuja",
    "Kaduna",
    "Ogun",
    "Delta",
    "Jos",
    "Abia",
  ];

  // Polling Units
  static List<Map<String, dynamic>> pollingUnits = [
    // Lagos state
    {
      "Lagos": [
        {
          "local_government": "Agege",
          "wards": [
            {
              "ward_name": "Abattoir",
              "polling_units": [
                "Abattoir Matori",
                "Moluke Primary School",
              ]
            },
            {
              "ward_name": "Agbotikuyo",
              "polling_units": [
                "New Oko-Oba Primary School",
                "Agbotikuyo Agege",
                "Oniwaya Primary School"
              ]
            },
            {
              "ward_name": "Isale Oja",
              "polling_units": [
                "Kemfat High School",
                "Awori Street Agege",
                "Isale Oja Agege"
              ]
            },
            {
              "ward_name": "Oko-Oba",
              "polling_units": [
                "Abimbola Primary School",
                "Abesan Primary School",
                "Oko-Oba Agege"
              ]
            }
          ]
        },
        {
          "local_government": "Alimosho",
          "wards": [
            {
              "ward_name": "Ayobo/Ipaja",
              "polling_units": [
                "Ayobo Comprehensive High School",
                "Ipaja Town Hall",
                "Oluwakemi Primary School"
              ]
            },
            {
              "ward_name": "Agbado/Oke-Odo",
              "polling_units": [
                "Community Primary School, Agbado",
                "Meiran Community Primary School",
                "Akinde Primary School"
              ]
            },
            {
              "ward_name": "Egbe/Idimu",
              "polling_units": [
                "Lagos State Polytechnic",
                "Idimu Road Primary School",
                "Ikotun High School"
              ]
            },
            {
              "ward_name": "Mosan/Okunola",
              "polling_units": [
                "Olugbenga Primary School",
                "Meiran Community Primary School",
                "Mosan Okunola Community Hall"
              ]
            }
          ]
        },
        {
          "local_government": "Amuwo-Odofin",
          "wards": [
            {
              "ward_name": "Kirikiri",
              "polling_units": [
                "MRS Filling Station",
                "St. Matthew Primary School",
                "Lifecare Hospital"
              ]
            },
            {
              "ward_name": "Mile 2",
              "polling_units": [
                "Sanya College",
                "Lagos State Polytechnic Annex",
                "Kirikiri Medium Security Prison"
              ]
            },
            {
              "ward_name": "Festac Town",
              "polling_units": [
                "Adeniran Ogunsanya College",
                "Festac Town Secretariat",
                "Children's International School"
              ]
            }
          ]
        },
        {
          "local_government": "Apapa",
          "wards": [
            {
              "ward_name": "Apapa I",
              "polling_units": [
                "Badagry Motor Park",
                "Randle Avenue Primary School",
                "Liverpool Girls High School"
              ]
            },
            {
              "ward_name": "Apapa II",
              "polling_units": [
                "Apapa Village Hall",
                "Oguntolu Primary School",
                "Agbede Community Hall"
              ]
            },
          ]
        }
      ],
    },

    // Kano State
    {
      "Kano": [
        {
          "local_government": "Kumbotso",
          "wards": [
            {
              "ward_name": "Kumbotso I",
              "polling_units": [
                "Magama Gumau, Janguza",
                "Kumbotso Town Hall",
                "Gumau, Janguza"
              ]
            },
            {
              "ward_name": "Kumbotso II",
              "polling_units": [
                "Tattarawa Kofar Fada",
                "Tattarawa Kofar Fada",
                "Tattarawa Kofar Fada"
              ]
            },
            {
              "ward_name": "Kumbotso III",
              "polling_units": [
                "Yan-Azara, Unguwar Dabai",
                "Bakin Dawaki, Dan-Agundi",
                "Bakin Dawaki, Dan-Agundi"
              ]
            },
            {
              "ward_name": "Kumbotso IV",
              "polling_units": [
                "Yan-Azara, Gwarzo Road",
                "Bakin Zuwo, Batazuwa",
                "Bakin Zuwo, Batazuwa"
              ]
            }
          ]
        },
        {
          "local_government": "Gwale",
          "wards": [
            {
              "ward_name": "Filin Hockey",
              "polling_units": [
                "Danfili 2 Primary School",
                "Kofar Gidan Sarki Primary School"
              ]
            },
            {
              "ward_name": "Dan-Agundi",
              "polling_units": [
                "Dambatta 1 Primary School",
                "Bakin Kura Primary School"
              ]
            },
            {
              "ward_name": "Gwale Central",
              "polling_units": [
                "Sa’idu Kiru Primary School",
                "Danmarna Primary School"
              ]
            }
          ]
        },
        {
          "local_government": "Tarauni",
          "wards": [
            {
              "ward_name": "Tarauni I",
              "polling_units": [
                "B. T. S. Primary School",
                "Takuti Primary School"
              ]
            },
            {
              "ward_name": "Tarauni II",
              "polling_units": [
                "Danmarna Primary School",
                "Kofar Mazugal Primary School"
              ]
            },
            {
              "ward_name": "Tarauni III",
              "polling_units": [
                "Yan-tsamiya Primary School",
                "Gama Primary School"
              ]
            }
          ]
        },
        {
          "local_government": "Nassarawa",
          "wards": [
            {
              "ward_name": "Dala Uku",
              "polling_units": [
                "Yandutse Primary School",
                "Rijiyar Lemo Primary School"
              ]
            },
            {
              "ward_name": "Gyadi-Gyadi",
              "polling_units": [
                "Kofar Dan Agundi Primary School",
                "Filin Idi Primary School"
              ]
            },
            {
              "ward_name": "Sharada",
              "polling_units": [
                "Sharada Primary School",
                "Dadin Kowa Primary School"
              ]
            }
          ]
        },
      ]
    },

    // Anambra
    {
      "Anambra": [
        {
          "local_government": "Aguata",
          "wards": [
            {
              "ward_name": "Achalla",
              "polling_units": [
                "Central Sch, Achalla",
                "Achalla Town Hall",
                "Afor Nnebisi, Achalla"
              ]
            },
            {
              "ward_name": "Aguluezechukwu",
              "polling_units": [
                "Akukwa Hall, Aguluezechukwu",
                "Health Centre, Nkpologwu",
                "Aguluezechukwu Town Hall"
              ]
            },
            {
              "ward_name": "Akpo",
              "polling_units": [
                "Community Primary School, Akpo",
                "Health Centre, Ekwulobia",
                "Akpo Town Hall"
              ]
            }
          ]
        },
        {
          "local_government": "Anambra East",
          "wards": [
            {
              "ward_name": "Amansea",
              "polling_units": [
                "St. Martins School, Amansea",
                "Central School, Amansea",
                "Amansea Town Hall"
              ]
            },
            {
              "ward_name": "Eziagulu Otu",
              "polling_units": [
                "St. Charles Borromeo School, Eziagulu Otu",
                "Eziagulu Otu Town Hall",
                "Eziagulu Otu Health Centre"
              ]
            },
            {
              "ward_name": "Igbakwu",
              "polling_units": [
                "Central School, Igbakwu",
                "Igbakwu Community Hall",
                "St. Joseph School, Igbakwu"
              ]
            }
          ]
        },
        {
          "local_government": "Anambra West",
          "wards": [
            {
              "ward_name": "Anam",
              "polling_units": [
                "Nnebe Primary School, Anam",
                "Central School, Anam",
                "Anam High School, Anam"
              ]
            },
            {
              "ward_name": "Igwumaeze",
              "polling_units": [
                "Igwumaeze Community School",
                "Igwumaeze Health Centre",
                "Igwumaeze Town Hall"
              ]
            },
            {
              "ward_name": "Nando",
              "polling_units": [
                "Nando Community School",
                "Nando Town Hall",
                "Health Centre, Nando"
              ]
            }
          ]
        },
      ]
    },

    // Enugu
    {
      "Enugu": [
        {
          "local_government": "Enugu East",
          "wards": [
            {
              "ward_name": "Akpugo",
              "polling_units": [
                "Akpugo Community Primary School",
                "Akama Primary School",
                "Akpugo Civic Centre"
              ]
            },
            {
              "ward_name": "Amankwo",
              "polling_units": [
                "St. Marks Primary School",
                "Town Hall, Amankwo",
                "Community Secondary School, Amankwo"
              ]
            },
            {
              "ward_name": "Amechi-Idodo",
              "polling_units": [
                "Community Primary School, Amechi-Idodo",
                "Community High School, Amechi-Idodo",
                "Health Centre, Amechi-Idodo"
              ]
            }
          ]
        },
        {
          "local_government": "Enugu North",
          "wards": [
            {
              "ward_name": "Coal Camp",
              "polling_units": [
                "Community Secondary School, Coal Camp",
                "St. Peters Primary School, Coal Camp",
                "Amala/Asogu Village Hall"
              ]
            },
            {
              "ward_name": "Eke",
              "polling_units": [
                "Community Secondary School, Eke",
                "Amube Amaokwe Village Hall",
                "Eke Town Hall"
              ]
            },
            {
              "ward_name": "Ogui",
              "polling_units": [
                "St. Theresa Primary School, Ogui",
                "Ogui Town Hall",
                "Community Secondary School, Ogui"
              ]
            }
          ]
        },
        {
          "local_government": "Enugu South",
          "wards": [
            {
              "ward_name": "Aguabor",
              "polling_units": [
                "Aguabor Village Hall",
                "Community Primary School, Aguabor",
                "St. Patricks Primary School, Aguabor"
              ]
            },
            {
              "ward_name": "Nkpotokwu",
              "polling_units": [
                "Community Primary School, Nkpotokwu",
                "Nkpotokwu Village Hall",
                "Community Secondary School, Nkpotokwu"
              ]
            },
            {
              "ward_name": "Uwani",
              "polling_units": [
                "St. Pauls Primary School, Uwani",
                "Uwani Town Hall",
                "Community Secondary School, Uwani"
              ]
            }
          ]
        },
      ]
    },

    // Abuja

    {
      "Abuja": [
        {
          "local_government": "Abaji",
          "wards": [
            {
              "ward_name": "Gwagwalada/Abaji",
              "polling_units": [
                "Old Kogi Garage",
                "Abaji Central Primary School",
                "Ibwa Primary School"
              ]
            },
            {
              "ward_name": "Kwali",
              "polling_units": [
                "Kwali Town Hall",
                "Dangara Primary School",
                "L.E.A. Primary School, Bako"
              ]
            },
            {
              "ward_name": "Yaba",
              "polling_units": [
                "L.E.A. Primary School, Yaba",
                "Yaba Model School",
                "L.E.A. Primary School, Galuwyi"
              ]
            }
          ]
        },
        {
          "local_government": "Bwari",
          "wards": [
            {
              "ward_name": "Kubwa",
              "polling_units": [
                "Government Secondary School, Kubwa",
                "Nyanya Primary School",
                "L.E.A. Primary School, Byazhin"
              ]
            },
            {
              "ward_name": "Ushafa",
              "polling_units": [
                "Ushafa Town Hall",
                "L.E.A. Primary School, Pasepa",
                "L.E.A. Primary School, Ushafa"
              ]
            },
            {
              "ward_name": "Bwari Central",
              "polling_units": [
                "Bwari Market",
                "Bwari Town Hall",
                "L.E.A. Primary School, Gwagwa"
              ]
            }
          ]
        },
        {
          "local_government": "Gwagwalada",
          "wards": [
            {
              "ward_name": "Dobi",
              "polling_units": [
                "Dobi Town Hall",
                "L.E.A. Primary School, Dobi",
                "L.E.A. Primary School, Galuwyi"
              ]
            },
            {
              "ward_name": "Zuba",
              "polling_units": [
                "Zuba Town Hall",
                "L.E.A. Primary School, Zuba",
                "L.E.A. Primary School, Gwako"
              ]
            },
            {
              "ward_name": "Gwagwalada",
              "polling_units": [
                "L.E.A. Primary School, Kuduru",
                "L.E.A. Primary School, Gwagwalada",
                "Gwagwalada Market"
              ]
            }
          ]
        },
      ]
    },

    // Kaduna
    {
      "Kaduna": [
        {
          "local_government": "Chikun",
          "wards": [
            {
              "ward_name": "Kujama",
              "polling_units": [
                "ECWA Nursery and Primary School, Kujama",
                "Kujama Palace",
                "Gadam Market, Kujama"
              ]
            },
            {
              "ward_name": "Sabon Tasha",
              "polling_units": [
                "Sabon Tasha Palace",
                "Nigerian Air Force Base, Sabon Tasha",
                "Nigerian Union of Teachers, Sabon Tasha"
              ]
            },
            {
              "ward_name": "Mararraban Rido",
              "polling_units": [
                "Community Primary School, Mararraban Rido",
                "Rido Palace",
                "Angwan Kaura"
              ]
            }
          ]
        },
        {
          "local_government": "Igabi",
          "wards": [
            {
              "ward_name": "Rigasa",
              "polling_units": [
                "L.E.A. Primary School, Rigasa",
                "Rigasa Palace",
                "Unguwar Rimi Primary School, Rigasa"
              ]
            },
            {
              "ward_name": "Tudun Wada",
              "polling_units": [
                "Community Primary School, Tudun Wada",
                "Tudun Wada Palace",
                "L.E.A. Primary School, Tudun Wada"
              ]
            },
            {
              "ward_name": "Doka",
              "polling_units": [
                "Doka Palace",
                "L.E.A. Primary School, Doka",
                "Unguwar Rimi Primary School, Doka"
              ]
            }
          ]
        },
        {
          "local_government": "Kajuru",
          "wards": [
            {
              "ward_name": "Kajuru Central",
              "polling_units": [
                "Kajuru Central Primary School",
                "Kajuru Palace",
                "L.E.A. Primary School, Maraban Kajuru"
              ]
            },
            {
              "ward_name": "Kufana",
              "polling_units": [
                "L.E.A. Primary School, Kufana",
                "Kufana Palace",
                "Unguwan Mahuta Primary School, Kufana"
              ]
            },
            {
              "ward_name": "Idon",
              "polling_units": [
                "L.E.A. Primary School, Idon",
                "Idon Palace",
                "Unguwar Sada Primary School, Idon"
              ]
            }
          ]
        },
      ]
    },

    // Ogun
    {
      "Ogun": [
        {
          "local_government": "Abeokuta North",
          "wards": [
            {
              "ward_name": "Imala",
              "polling_units": [
                "St. Paul's Pry. School, Imala",
                "St. John's Pry. School, Imala",
                "S.M.A Pry. School, Imala"
              ]
            },
            {
              "ward_name": "Oke-Aje Market",
              "polling_units": [
                "Baptist Pry. School, Oke-Aje",
                "Ansar-Ud-Deen Pry. School, Oke-Aje",
                "Methodist Pry. School, Oke-Aje"
              ]
            },
            {
              "ward_name": "Oke-Lantoro",
              "polling_units": [
                "St. Peters Pry. School, Oke-Lantoro",
                "Salvation Army Pry. School, Oke-Lantoro",
                "St. Peters Pry. School, Oke-Lantoro 2"
              ]
            }
          ]
        },
        {
          "local_government": "Abeokuta South",
          "wards": [
            {
              "ward_name": "Lisabi",
              "polling_units": [
                "Methodist Pry. School, Lisabi",
                "St. John's Pry. School, Lisabi",
                "St. Peters Pry. School, Lisabi"
              ]
            },
            {
              "ward_name": "Ibara",
              "polling_units": [
                "Baptist Pry. School, Ibara",
                "Methodist Pry. School, Ibara",
                "St. Peters Pry. School, Ibara"
              ]
            },
            {
              "ward_name": "Lafenwa",
              "polling_units": [
                "Baptist Pry. School, Lafenwa",
                "Ansar-Ud-Deen Pry. School, Lafenwa",
                "C&S Pry. School, Lafenwa"
              ]
            }
          ]
        },
        {
          "local_government": "Ewekoro",
          "wards": [
            {
              "ward_name": "Itori",
              "polling_units": [
                "St. John's Pry. School, Itori",
                "Methodist Pry. School, Itori",
                "St. Paul's Pry. School, Itori"
              ]
            },
            {
              "ward_name": "Lafenwa/Ayetoro Road",
              "polling_units": [
                "Baptist Pry. School, Lafenwa/Ayetoro Road",
                "C&S Pry. School, Lafenwa/Ayetoro Road",
                "Methodist Pry. School, Lafenwa/Ayetoro Road"
              ]
            },
            {
              "ward_name": "Arigbajo",
              "polling_units": [
                "Baptist Pry. School, Arigbajo",
                "Methodist Pry. School, Arigbajo",
                "St. Peters Pry. School, Arigbajo"
              ]
            }
          ],
        },
      ]
    },

    // Osun
    // {
    //   "Osun": [
    //     {
    //       "local_government": "Atakumosa West",
    //       "wards": [
    //         {
    //           "ward_name": "Iperindo I",
    //           "polling_units": [
    //             "St. Peters Pry. School, Iperindo",
    //             "Baptist Pry. School, Iperindo",
    //             "Methodist Pry. School, Iperindo"
    //           ]
    //         },
    //         {
    //           "ward_name": "Ijebu-Jesa III",
    //           "polling_units": [
    //             "Baptist Pry. School, Ijebu-Jesa",
    //             "Methodist Pry. School, Ijebu-Jesa",
    //             "Ansar-Ud-Deen Pry. School, Ijebu-Jesa"
    //           ]
    //         },
    //         {
    //           "ward_name": "Idominasi",
    //           "polling_units": [
    //             "St. John's Pry. School, Idominasi",
    //             "Ansar-Ud-Deen Pry. School, Idominasi",
    //             "C&S Pry. School, Idominasi"
    //           ]
    //         }
    //       ]
    //     },
    //     {
    //       "local_government": "Ede South",
    //       "wards": [
    //         {
    //           "ward_name": "Oke-Gada III",
    //           "polling_units": [
    //             "St. Paul's Pry. School, Oke-Gada",
    //             "Baptist Pry. School, Oke-Gada",
    //             "Methodist Pry. School, Oke-Gada"
    //           ]
    //         },
    //         {
    //           "ward_name": "Oluwole III",
    //           "polling_units": [
    //             "Ansar-Ud-Deen Pry. School, Oluwole",
    //             "Baptist Pry. School, Oluwole",
    //             "Methodist Pry. School, Oluwole"
    //           ]
    //         },
    //         {
    //           "ward_name": "Akoda I",
    //           "polling_units": [
    //             "St. Peters Pry. School, Akoda",
    //             "Ansar-Ud-Deen Pry. School, Akoda",
    //             "C&S Pry. School, Akoda"
    //           ]
    //         }
    //       ],
    //     },
    //     {
    //       "local_government": "Boluwaduro",
    //       "wards": [
    //         {
    //           "ward_name": "Boluwaduro II",
    //           "polling_units": [
    //             "St. Peters Pry. School, Boluwaduro",
    //             "Methodist Pry. School, Boluwaduro",
    //             "Baptist Pry. School, Boluwaduro"
    //           ]
    //         },
    //         {
    //           "ward_name": "Otun",
    //           "polling_units": [
    //             "St. Peters Pry. School, Otun",
    //             "C&S Pry. School, Otun",
    //             "St. John's Pry. School, Otun"
    //           ]
    //         },
    //         {
    //           "ward_name": "Otudan",
    //           "polling_units": [
    //             "Ansar-Ud-Deen Pry. School, Otudan",
    //             "Baptist Pry. School, Otudan",
    //             "Methodist Pry. School, Otudan"
    //           ]
    //         }
    //       ],
    //     },
    //   ]
    // },

    // Delta
    {
      "Delta": [
        {
          "local_government": "Aniocha South",
          "wards": [
            {
              "ward_name": "Ubulu-Uku III",
              "polling_units": [
                "Ubulu-Uku Pry. School, Ubulu-Uku",
                "Ezekwuabo Pry. School, Ubulu-Uku",
                "St. Peters Pry. School, Ubulu-Uku"
              ]
            },
            {
              "ward_name": "Adonte II",
              "polling_units": [
                "Ogbeani Pry. School, Adonte",
                "Ejeme-Ani Pry. School, Adonte",
                "Ejeme-Ani Town Hall, Adonte"
              ]
            },
            {
              "ward_name": "Adonte III",
              "polling_units": [
                "Ejeme-Ani Pry. School, Adonte",
                "Ejeme-Ani Town Hall, Adonte",
                "Ejeme-Ani Sec. School, Adonte"
              ]
            }
          ]
        },
        {
          "local_government": "Ughelli South",
          "wards": [
            {
              "ward_name": "Oteri",
              "polling_units": [
                "Oteri Pry. School, Oteri",
                "Oteri Town Hall, Oteri",
                "Oteri Secondary School, Oteri"
              ]
            },
            {
              "ward_name": "Orogun I",
              "polling_units": [
                "Ejeweme Pry. School, Orogun",
                "St. Michael Pry. School, Orogun",
                "Orogun Town Hall, Orogun"
              ]
            },
            {
              "ward_name": "Orogun II",
              "polling_units": [
                "Eruemukowharien Pry. School, Orogun",
                "St. Michael Sec. School, Orogun",
                "Orogun Town Hall, Orogun"
              ]
            }
          ],
        },
        {
          "local_government": "Warri North",
          "wards": [
            {
              "ward_name": "Koko I",
              "polling_units": [
                "Koko Pry. School, Koko",
                "Koko Town Hall, Koko",
                "Koko Grammar School, Koko"
              ]
            },
            {
              "ward_name": "Egbo",
              "polling_units": [
                "Egbo Pry. School, Egbo",
                "Egbo Town Hall, Egbo",
                "Egbo Secondary School, Egbo"
              ]
            },
            {
              "ward_name": "Koko III",
              "polling_units": [
                "Koko Pry. School, Koko",
                "Koko Town Hall, Koko",
                "Koko Grammar School, Koko"
              ]
            }
          ],
        },
      ]
    },

    // Jos
    {
      "Jos": [
        {
          "local_government": "Jos North",
          "wards": [
            {
              "ward_name": "Anguwan Rukuba",
              "polling_units": [
                "St. Mathias Pry School, Jos",
                "City Academy, Jos",
                "UNEC Primary School, Jos"
              ]
            },
            {
              "ward_name": "Farin Gada",
              "polling_units": [
                "St. Peters Pry School, Jos",
                "Christ the King Pry School, Jos",
                "FGGC Staff Primary School, Jos"
              ]
            },
            {
              "ward_name": "Laranto",
              "polling_units": [
                "COCIN Primary School, Jos",
                "Nasarawa Gwong Primary School, Jos",
                "Magaji Primary School, Jos"
              ]
            }
          ],
        },
        {
          "local_government": "Jos South",
          "wards": [
            {
              "ward_name": "Rikkos",
              "polling_units": [
                "Gwom Rikkos Primary School, Jos",
                "St. Theresa's Catholic Church, Jos",
                "ECWA Nursery and Primary School, Jos"
              ]
            },
            {
              "ward_name": "Tudun Wada",
              "polling_units": [
                "Zarmaganda Primary School, Jos",
                "Shere Kura Primary School, Jos",
                "COCIN Rantya Primary School, Jos"
              ]
            },
            {
              "ward_name": "Kabong",
              "polling_units": [
                "St. Louis Catholic Church, Jos",
                "L.E.A Primary School, Jos",
                "P.O.P Primary School, Jos"
              ]
            }
          ],
        },
        {
          "local_government": "Warri North",
          "wards": [
            {
              "ward_name": "Koko I",
              "polling_units": [
                "Koko Pry. School, Koko",
                "Koko Town Hall, Koko",
                "Koko Grammar School, Koko"
              ]
            },
            {
              "ward_name": "Egbo",
              "polling_units": [
                "Egbo Pry. School, Egbo",
                "Egbo Town Hall, Egbo",
                "Egbo Secondary School, Egbo"
              ]
            },
            {
              "ward_name": "Koko III",
              "polling_units": [
                "Koko Pry. School, Koko",
                "Koko Town Hall, Koko",
                "Koko Grammar School, Koko"
              ]
            }
          ],
        },
      ]
    },

    // Abia
    {
      "Abia": [
        {
          "local_government": "Aba North",
          "wards": [
            {
              "ward_name": "Aba Urban Ward 1",
              "polling_units": [
                "Umuola Hall, Aba",
                "Aba North LGA Secretariat",
                "Umuibe Hall, Aba"
              ]
            },
            {
              "ward_name": "Aba Urban Ward 2",
              "polling_units": [
                "St. Michaels Pry School, Aba",
                "Ndiya Hall, Aba",
                "Eziukwu Central School, Aba"
              ]
            },
            {
              "ward_name": "Aba Urban Ward 3",
              "polling_units": [
                "St. George's Pry School, Aba",
                "Orizu Hall, Aba",
                "Abia Poly Annex Hall, Aba"
              ]
            }
          ]
        },
        {
          "local_government": "Aba South",
          "wards": [
            {
              "ward_name": "Aba Urban Ward 4",
              "polling_units": [
                "Ovom Girls Secondary School, Aba",
                "Oroazi Secondary School, Aba",
                "Okpu-Umuobo Hall, Aba"
              ]
            },
            {
              "ward_name": "Aba Urban Ward 5",
              "polling_units": [
                "Christ the King Pry School, Aba",
                "St. Silas Primary School, Aba",
                "St. Theresa's Pry School, Aba"
              ]
            },
            {
              "ward_name": "Aba Urban Ward 6",
              "polling_units": [
                "Girls High School, Aba",
                "Asa Girls Secondary School, Aba",
                "Okigwe Hall, Aba"
              ]
            }
          ],
        },
        {
          "local_government": "Bende",
          "wards": [
            {
              "ward_name": "Agburike",
              "polling_units": [
                "Agburike Town Hall",
                "Agburike Pry School",
                "Arochukwu St. Pry School"
              ]
            },
            {
              "ward_name": "Item",
              "polling_units": [
                "Item Town Hall",
                "Community Primary School Item",
                "Assemblies of God Pry School, Item"
              ]
            },
            {
              "ward_name": "Ugwueziukwu",
              "polling_units": [
                "Ugwueziukwu Town Hall",
                "St. Peter's Primary School",
                "Akpulu Primary School"
              ]
            }
          ],
        },
        {
          "local_government": "Ikwuano",
          "wards": [
            {
              "ward_name": "Isiala Ward",
              "polling_units": [
                "Ohanze Town Hall",
                "Amiyi Village Hall",
                "Isiala Town Hall"
              ]
            },
            {
              "ward_name": "Ikwuano Urban Ward 1",
              "polling_units": [
                "Umuokoro Village Hall",
                "Ndiawa Village Hall",
                "Obohia Town Hall"
              ]
            },
            {
              "ward_name": "Ikwuano Urban Ward 2",
              "polling_units": [
                "Oloko Town Hall",
                "Obot Akara Village Hall",
              ]
            }
          ],
        },
        {
          "local_government": "Isiala Ngwa North",
          "wards": [
            {
              "ward_name": "Ward 1",
              "polling_units": [
                "Umuneke Primary School",
                "Umukabi Primary School",
                "Umumba Primary School",
                "Umunkpeyi Primary School"
              ]
            },
            {
              "ward_name": "Ward 2",
              "polling_units": [
                "Mbutu Primary School",
                "Umuapu Primary School",
                "Umuokoro Primary School",
                "Umuohu Primary School"
              ]
            },
            {
              "ward_name": "Ward 3",
              "polling_units": [
                "Amiyi Oboro Primary School",
                "Amiyi Osuama Primary School",
                "Umuene Primary School",
                "Ntigha Primary School"
              ]
            }
          ],
        },
        {
          "local_government": "Isiala Ngwa South",
          "wards": [
            {
              "ward_name": "Ward 1",
              "polling_units": [
                "Owerenta Primary School",
                "Arochukwu Primary School",
                "Ibeku Primary School",
                "Umuola Primary School"
              ]
            },
            {
              "ward_name": "Ward 2",
              "polling_units": [
                "Amaiyi Okwu Primary School",
                "Amaiyi Oboro Primary School",
                "Amogudu Primary School",
                "Amuzukwu Primary School"
              ]
            },
            {
              "ward_name": "Ward 3",
              "polling_units": [
                "Nneato Primary School",
                "Isiama Primary School",
                "Ohanze Central School",
                "Amaise Primary School"
              ]
            }
          ],
        },
      ]
    },
  ];
}
