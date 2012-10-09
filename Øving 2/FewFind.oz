\insert 'Lists.oz'
\insert 'Visualizer.oz'
%\insert 'ApplyMoves.oz'

declare
fun{SplitTrain Xs Y}
   Pos = {Position Xs Y} in
   {Take Xs Pos-1}#{Drop Xs Pos}
end

fun{Find Xs Ys}
   case Ys of nil then nil
  % [] == Ys then nil
   []Y|Yr then
      if({Position Xs Y} == {Position Ys Y}) then
	 {Find Xs Yr}
      else
	 local  Hs Ts Move1 Move2 in
	    Hs#Ts = {SplitTrain Xs Y}
	    Move1 = {Length Ts} % + må ha med Y også
	    Move2 = {Length Hs}

	    trackA(Move1)|trackB(Move2)|trackA(~Move1)|trackB(~Move2)|{Find {Append Ts Hs} Yr}
	 end
      end
   end
end

%{Visualize {ApplyMoves state(main:[a b c d] trackA:nil trackB:nil) {Find [a b c d] [d a c b]}}}
{Browse {Find [c a b] [c b a]}}

