#Riddim generator v1 by R4KE
# ___ _    _    _ _
#| _ (_)__| |__| (_)_ __    __ _ ___ _ _
#|   / / _` / _` | | '  \  / _` / -_) ' \
#|_|_\_\__,_\__,_|_|_|_|_| \__, \___|_||_|
#                          |___/

set_volume! 2

set :bpm , 140
use_bpm get(:bpm)

# Oscilators

squareAmount = 2 # 1 for x2, 2 for x4, 3 for 8x   (if value is not exactly 1, 2 or 3, it won't work!)
squarePitch = 28
detuneMultiplier = 1
length = 0.5

# FX

flangerEnabled = 0
reverbEnabled = 1
wobbleEnabled = 0
eqEnabled = 1
hpfEnabled = 1


live_loop :synths do
  with_fx :wobble, mix: wobbleEnabled, phase_offset: length, phase: (length * 2), filter: 0, cutoff_min: 10, cutoff_max: 80, res: 0.75, wave: 3 do
    with_fx :reverb, mix: (reverbEnabled / 1.7), damp: 0.5, room: 0.6, release: 2 do
      with_fx :flanger, mix: flangerEnabled, decay: 2, feedback: 0.7, phase: 0.5, wave: 3, depth: -1.6 do
        with_fx :hpf, mix: hpfEnabled, cutoff: 50 do
          with_fx :eq, mix: eqEnabled, high_note: 110, low_shelf: 1.5, high_shelf: 3 do
            use_synth :square
            if squareAmount == 1 then
              play squarePitch + (0.0 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.1 * detuneMultiplier), attack: length, release: length
            end
            if squareAmount == 2 then
              play squarePitch + (0.0 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.1 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.2 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.3 * detuneMultiplier), attack: length, release: length
            end
            if squareAmount == 3 then
              play squarePitch + (0.0 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.1 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.2 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.3 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.4 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.5 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.6 * detuneMultiplier), attack: length, release: length
              play squarePitch + (0.7 * detuneMultiplier), attack: length, release: length
            end
            wait length * 2
          end
        end
      end
    end
  end
end