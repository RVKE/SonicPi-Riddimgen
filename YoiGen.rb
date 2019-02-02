#Riddim generator v2 by R4KE
# __   __   _
# \ \ / /__(_)  __ _ ___ _ _
#  \ V / _ \ | / _` / -_) ' \
#   |_|\___/_| \__, \___|_||_|
#              |___/

#General settings

volume = 2
beatsperminute = 140
waitTime = 1

#Synth settings

lfo = 1

wtPitch = 28
wtRelease = 0.7
wtAmplitude = 2

sampleRate = 2000
synthDepth = -2


set_volume! volume
set :bpm , beatsperminute
use_bpm get(:bpm)

with_fx :gverb, spread: 0.5, room: 10, mix: 0.5, damp: 0.5, release: 0.3 do
  with_fx :flanger, decay: 2, feedback: 0.7, mix: 1, phase: 2, wave: 3, depth: synthDepth do
    with_fx :bitcrusher, mix: 1, sample_rate: sampleRate, bits: 16 do
      with_fx :wobble, phase_offset: 0.5, phase: 1, filter: 0, mix: 1, cutoff_min: 10, cutoff_max: 80, res: 0.75, wave: 3 do
        live_loop :synths do
          use_synth :square
          play wtPitch, amp: wtAmplitude, release: wtRelease
          wait waitTime
        end
      end
    end
  end
end