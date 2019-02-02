#Riddim generator v2 by R4KE
# __   __   _
# \ \ / /__(_)  __ _ ___ _ _
#  \ V / _ \ | / _` / -_) ' \
#   |_|\___/_| \__, \___|_||_|
#              |___/

set_volume! 2

set :bpm , 140
use_bpm get(:bpm)

sampleRate = 2000
synthPitch = 28
synthDepth = -2

with_fx :gverb, spread: 0.5, room: 10, mix: 0.5, damp: 0.5, release: 0.3 do
  with_fx :flanger, decay: 2, feedback: 0.7, mix: 1, phase: 2, wave: 3, depth: synthDepth do
    with_fx :bitcrusher, mix: 1, sample_rate: sampleRate, bits: 16 do
      with_fx :wobble, phase_offset: 0.5, phase: 1, filter: 0, mix: 1, cutoff_min: 10, cutoff_max: 80, res: 0.75, wave: 3 do
        live_loop :synths do
          use_synth :square
          play synthPitch, amp: 2, cutoff: 100, release: 0.7
          wait 1
        end
      end
    end
  end
end