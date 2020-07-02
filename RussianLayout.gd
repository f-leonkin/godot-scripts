extends Node

# The Godot Engine doesn't handle key presses in russian layout properly.
# This script catches key presses events, and if there was a key in russian
# layout pressed, it parses a new event with corresponding latin key.

# Godot не обрабатывает нажатия клавиш в русской раскладке должным образом.
# Этот скрипт отлавливает нажатия клавиш, и если была нажата клавиша в русской
# раскладке, скрипт посылает новое событие с соответствующей латинской клавишей.

func _input(event):
	if event is InputEventKey:
		parse_key_event(event)


func parse_key_event(event):
	var ev = event
	match event.unicode:
		1105: # Ё -> `
			ev.scancode = 96
			ev.unicode = 96
		1081: # Й -> Q
			ev.scancode = 81
			ev.unicode = 113
		1094: # Ц -> W
			ev.scancode = 87
			ev.unicode = 119
		1091: # У -> E
			ev.scancode = 69
			ev.unicode = 101
		1082: # К -> R
			ev.scancode = 82
			ev.unicode = 114
		1077: # Е -> T
			ev.scancode = 84
			ev.unicode = 116
		1085: # Н -> Y
			ev.scancode = 89
			ev.unicode = 121
		1075: # Г -> U
			ev.scancode = 85
			ev.unicode = 117
		1096: # Ш -> I
			ev.scancode = 73
			ev.unicode = 105
		1097: # Щ -> O
			ev.scancode = 79
			ev.unicode = 111
		1079: # З -> P
			ev.scancode = 80
			ev.unicode = 112
		1093: # Х -> [
			ev.scancode = 91
			ev.unicode = 91
		1098: # Ъ -> ]
			ev.scancode = 93
			ev.unicode = 93
		1092: # Ф -> A
			ev.scancode = 65
			ev.unicode = 97
		1099: # Ы -> S
			ev.scancode = 83
			ev.unicode = 115
		1074: # В -> D
			ev.scancode = 68
			ev.unicode = 100
		1072: # А -> F
			ev.scancode = 70
			ev.unicode = 102
		1087: # П -> G
			ev.scancode = 71
			ev.unicode = 103
		1088: # Р -> H
			ev.scancode = 72
			ev.unicode = 104
		1086: # О -> J
			ev.scancode = 74
			ev.unicode = 106
		1083: # Л -> K
			ev.scancode = 75
			ev.unicode = 107
		1076: # Д -> L
			ev.scancode = 76
			ev.unicode = 108
		1078: # Ж -> ;
			ev.scancode = 59
			ev.unicode = 59
		1101: # Э -> '
			ev.scancode = 39
			ev.unicode = 39
		1103: # Я -> Z
			ev.scancode = 90
			ev.unicode = 122
		1095: # Ч -> X
			ev.scancode = 88
			ev.unicode = 120
		1089: # С -> C
			ev.scancode = 67
			ev.unicode = 99
		1084: # М -> V
			ev.scancode = 86
			ev.unicode = 118
		1080: # И -> B
			ev.scancode = 66
			ev.unicode = 98
		1090: # Т -> N
			ev.scancode = 78
			ev.unicode = 110
		1100: # Ь -> M
			ev.scancode = 77
			ev.unicode = 109
		1073: # Б -> ,
			ev.scancode = 44
			ev.unicode = 44
		1102: # Ю -> .
			ev.scancode = 46
			ev.unicode = 46
		_:
			return
	Input.parse_input_event(ev)
