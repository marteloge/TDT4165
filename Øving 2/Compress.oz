declare
fun {ApplyRules Xs}
   case Xs of nil then
      nil
   [] trackA(N) | trackA(M) | T then
      trackA(N+M) | {ApplyRules T}
   [] trackB(N) | trackB(M) | T then
      trackB(N+M) | {ApplyRules T}
   [] H|T then
      if H == trackA(0) orelse H == trackB(0) then
	 {ApplyRules T}
      else
	 H | {ApplyRules T}
      end
   end
end


fun {Compress Ms}
   Ns = {ApplyRules Ms}
in
   if Ns==Ms then Ms else {Compress Ns} end
end

{Browse {Compress [trackB(~1) trackA(1) trackA(~1) trackB(1)]}}