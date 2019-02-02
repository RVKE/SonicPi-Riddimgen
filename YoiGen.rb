#Riddim generator v2 by R4KE
# __   __   _
# \ \ / /__(_)  __ _ ___ _ _
#  \ V / _ \ | / _` / -_) ' \
#   |_|\___/_| \__, \___|_||_|
#              |___/

#--------------------------------------------------------------------------------#

#General settings

volume = 2
beatsperminute = 140

#Synth settings

lfo = 1 # Value ranging from 0 to 2 (if integer)

wtPitch = 28 # Recommended from 25 to 35
wtRelease = 0.7

fxSampleRate = 2000 # Recommended from 1500 to 4000
fxFlangDepth = -2
fxFlangDecay = 2
fxFlangFeedback = 0.7
fxFlangWavetype = 3 # Value from 1, 2 or 3

#--------------------------------------------------------------------------------#

set_volume! volume
set :bpm , beatsperminute
use_bpm get(:bpm)

with_fx :gverb, mix: 0.5, spread: 0.5, room: 10, damp: 0.5, release: 0.3 do
  with_fx :flanger, mix: 1, decay: fxFlangDecay, feedback: fxFlangFeedback, phase: (2 / lfo), wavetype: fxFlangWavetype, depth: fxFlangDepth do
    with_fx :bitcrusher, mix: 1, sample_rate: fxSampleRate, bits: 16 do
      with_fx :wobble, phase_offset: 0.5, phase: (1.0 / lfo), filter: 0, mix: 1, cutoff_min: 10, cutoff_max: 80, res: 0.75, wave: 3 do
        live_loop :synths do
          use_synth :square
          play wtPitch, amp: 2, release: (wtRelease / lfo)
          wait (1.0 / lfo)
        end
      end
    end
  end
end