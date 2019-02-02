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
extraWaitTime = 0

#Synth settings

lfo = 4.0 # Value ranging above 0 (MUST BE A FLOAT)

wtPitch = 28 # Recommended from 25 to 35
wtRelease = 0.7

fxSampleRate = 2 # Recommended from 1.5 to 3.5
fxCutoffMultiplier = 0.24 # Value ranging from 0 to 1
fxFlangDepth = -2
fxFlangDecay = 2
fxFlangFeedback = 0.7
fxFlangWavetype = 3 # Value from 1, 2 or 3

#--------------------------------------------------------------------------------#

set_volume! volume
set :bpm , beatsperminute
use_bpm get(:bpm)
fxCutoffMultiplication = (1 + fxCutoffMultiplier)
fxSampleRateMultiplication = (fxSampleRate * 1000)
lfoMultiplication = (lfo / 4)
with_fx :gverb, mix: 0.5, spread: 0.5, room: 10, damp: 0.5, release: 0.3 do
  with_fx :flanger, mix: 1, decay: fxFlangDecay, feedback: fxFlangFeedback, phase: (2 / lfoMultiplication), wavetype: fxFlangWavetype, depth: fxFlangDepth do
    with_fx :bitcrusher, mix: 1, sample_rate: fxSampleRateMultiplication, bits: 16 do
      with_fx :wobble, phase_offset: 0.5, phase: (1.0 / lfoMultiplication), filter: 0, mix: 1, cutoff_min: (5 * fxCutoffMultiplication), cutoff_max: (64.5 * fxCutoffMultiplication), res: 0.75, wave: 3 do
        live_loop :synths do
          use_synth :square
          play wtPitch, amp: 2, release: (wtRelease / lfoMultiplication)
          wait ((1.0 / lfoMultiplication) + extraWaitTime)
        end
      end
    end
  end
end