-- Associer les numéros de note aux noms des objets 3DS Max
noteMapping = #(
    [1, "box_001"],
    [2, "box_002"],
    [3, "box_003"],
    [4, "box_004"],
    [5, "box_005"],
    [6, "box_006"],
    [7, "box_007"],
    [8, "box_008"],
    [9, "box_009"],
    [10, "box_010"],
    [11, "box_011"],
    [12, "box_012"],
    [13, "box_013"],
    [14, "box_014"],
    [15, "box_015"],
    [16, "box_016"],
    [17, "box_017"],
    [18, "box_018"],
    [19, "box_019"],
    [20, "box_020"],
    [21, "box_021"],
    [22, "box_022"],
    [23, "box_023"],
    [24, "box_024"],
    [25, "box_025"],
    [26, "box_026"],
    [27, "box_027"],
    [28, "box_028"],
    [29, "box_029"],
    [30, "box_030"],
    [31, "box_031"],
    [32, "box_032"],
    [33, "box_033"],
    [34, "box_034"],
    [35, "box_035"],
    [36, "box_036"],
    [37, "box_037"],
    [38, "box_038"],
    [39, "box_039"],
    [40, "box_040"],
    [41, "box_041"],
    [42, "box_042"],
    [43, "box_043"],
    [44, "box_044"],
    [45, "box_045"],
    [46, "box_046"],
    [47, "box_047"],
    [48, "box_048"],
    [49, "box_049"],
    [50, "box_050"],
    [51, "box_051"],
    [52, "box_052"],
    [53, "box_053"],
    [54, "box_054"],
    [55, "box_055"],
    [56, "box_056"],
    [57, "box_057"],
    [58, "box_058"],
    [59, "box_059"],
    [60, "box_060"],
    [61, "box_061"],
    [62, "box_062"],
    [63, "box_063"],
    [64, "box_064"],
    [65, "box_065"],
    [66, "box_066"],
    [67, "box_067"],
    [68, "box_068"],
    [69, "box_069"],
    [70, "box_070"],
    [71, "box_071"],
    [72, "box_072"],
    [73, "box_073"],
    [74, "box_074"],
    [75, "box_075"],
    [76, "box_076"],
    [77, "box_077"],
    [78, "box_078"],
    [79, "box_079"],
    [80, "box_080"],
    [81, "box_081"],
    [82, "box_082"],
    [83, "box_083"],
    [84, "box_084"],
    [85, "box_085"],
    [86, "box_086"],
    [87, "box_087"],
    [88, "box_088"]
)

for i=1 to noteMapping.count do (
    if noteMapping[i][1] == note do (
        obj = getNodeByName (noteMapping[i][2])
        playNote obj duration time
        break
    )
)

fn playNote obj duration time = (
   with animate on
   (
       at time time
       (
           obj.pos.z -= 2.98 -- Valeur Z de la translation sur l'axe Z
       )
   )
   with animate on
   (
       at time (time + duration)
       (
           obj.pos.z += 2.98 -- Valeur Z de la translation sur l'axe Z
       )
   )
)

file = openFile "C:/Users/hudno/Downloads/suicide/suicide/midi_data.csv" mode:"r"
skipToString file "," -- saute l'en-tête
while not eof file do (
   line = readLine file
	if line != "" do (
        tokens = filterString line ","
        note = tokens[1] as integer
        velocity = tokens[2] as integer
        time = tokens[3] as integer
        duration = tokens[4] as integer
   
        for i=1 to noteMapping.count do (
            if noteMapping[i][1] == note do (
                obj = getNodeByName (noteMapping[i][2])
                playNote obj duration time
                break
            )
        )
    )
)
close file

-- Afficher un message de confirmation
format "Les informations de note ont été animées dans 3ds Max.\n"