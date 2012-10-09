\insert 'Lists.oz'

declare
fun {ApplayMoves S Ms}
   case Ms of nil then [S]
   []M|Mr then
      S1 = case M of trackA(N) then
	      if N>0 then
		 state(main:{Take S.main {Length S.main}-N} trackA:{Append {Drop S.main {Length S.main}-N} S.trackA} trackB:S.trackB)
	      else
		 state(main:{Append S.main {Take S.trackA ~N}} trackA:{Drop S.trackA ~N} trackB:S.trackB)
	      end
	      
	   []trackB(N) then
	      if N>0 then
		 state(main:{Take S.main {Length S.main}-N} trackA:S.trackA trackB:{Append {Drop S.main {Length S.main}-N} S.trackB})
	      else
		 state(main:{Append S.main {Take S.trackA ~N}} trackA:S.track trackB:{Drop S.trackA ~N})
	      end
	      
	   end
   in
      S|{ApplayMoves S1 Mr}
   end
end

      {Browse {ApplayMoves state(main:[a b c] trackA:nil trackB:nil) [trackA(1) trackA(~1) trackB(2) trackA(1)]}} %~
      