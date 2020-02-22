extends HBoxContainer

export(NodePath) var gaugeNodePath

var barValue setget setBarValue, getBarValue
var barMaxValue setget setBarMaxValue, getBarMaxValue
var barMinValue setget setBarMinValue, getBarMinValue

func _ready():
	if not gaugeNodePath:
		gaugeNodePath = $"Count/Gauge"

func setBarValue(value):
	gaugeNodePath.value = value

func getBarValue():
	return gaugeNodePath.value

func setBarMaxValue(value):
	gaugeNodePath.max_value = value

func getBarMaxValue():
	return gaugeNodePath.max_value

func setBarMinValue(value):
	gaugeNodePath.min_value = value

func getBarMinValue():
	return gaugeNodePath.min_value
