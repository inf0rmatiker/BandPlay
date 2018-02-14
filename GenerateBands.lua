--[[
	Author: Caleb Carlson
	Date Created: 12/29/2017
	Last Revision: 12/29/2017
	Version Number: 1.0
]]
function Initialize()
	--Variables
	parentAudio = SKIN:GetMeasure("ParentAudio")
	numMeters = parentAudio:GetOption("Bands")
	x=SKIN:GetVariable("xPosition", 0)
	y=SKIN:GetVariable("yPosition", 0)
	w=SKIN:GetVariable("barWidth", 0)
	h=SKIN:GetVariable("barHeight", 0)
	barColor=SKIN:GetVariable("barColor", "White")
	barSpacing=SKIN:GetVariable("barSpacing", 2)
	print(barColor)
	
	--Write the Band Measures
	file = io.open(SKIN:MakePathAbsolute("@Resources/BandMeasures.inc"), "r+")	
	for i = 0, numMeters - 1, 1 do
		file:write(
		"[BandMeasure"..i.."]\n"
		.."Measure=Plugin\n"
		.."Plugin=AudioLevel\n"
		.."Parent=ParentAudio\n"
		.."Type=Band\n"
		.."BandIdx="..i.."\n\n"
		)
	end
	file:close()
	
	--Write the Band Meters
	file = io.open(SKIN:MakePathAbsolute("@Resources/BandMeters.inc"), "r+")
	--write first Band Meters w/ fixed position
	file:write("[BandMeter0]\nMeter=Bar\nMeasureName=BandMeasure0\nX="..x.."\nY="..y.."\nW="..w.."\nH="..h.."\nBarColor="..barColor.."\nBarOrientation=Vertical\n\n")
	--write all other Band Meters w/ relative position
	for j = 1, numMeters - 1, 1 do
		file:write(
		"[BandMeter"..j.."]\n"
		.."Meter=Bar\n"
		.."MeasureName=BandMeasure"..j.."\n"
		.."X="..barSpacing.."R\n"
		.."Y=0r\n"
		.."W="..w.."\n"
		.."H="..h.."\n"
		.."BarColor="..barColor.."\n"
		.."BarOrientation=Vertical\n\n"
		)
	end
	file:close()
	
end

function Update()
	
	return
end