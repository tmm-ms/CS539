% =========================================================================
% HIDDEN MARKOV MODELS
% https://www.mathworks.com/help/stats/hidden-markov-models-hmm.html
rng(1);

% =========================================================================
% 1. Consider the following sequence of observables:
%  PPPPCCPPPCCCPCCCCCPPPCPCP
%  What is the probability that this sequence was generated by our HMM?

% =========================================================================
% 2. What is the most likely sequence of hidden states that generated this
% sequence? Explain.

% =========================================================================
% 3. Assume that the sequence is numbered stating at 1 (i.e., the first
% element of the sequence, "P", is at position 1). What is the most likely
% hidden state that generated the "C" in position 10 of the sequence?

% =========================================================================
% 4. Use the HMM to generate a sequence of observables of length 2000.
% Then, use this generated sequence to learn the transition probabilities
% and the emision probabilities of a new hidden Markov model with 3 hidden
% states (let's forget about the "Start" state to simplify things). Compare
% the transition and emission probabilities of this new hidden Markov model
% with those of our original HMM.

% Prof. Ruiz

clear; close;

%% I took the following comments and commands from the Matlab help, and
%% I applied the commands to the pepsi-coke example from the 
%% tutorial slides used in class. See slide #14 of 
%% http://webcourse.cs.technion.ac.il/236522/Spring2007/ho/WCFiles/Tutorial05.ppt

% GENERATING A TEST SEQUENCE

% The following commands create the transition and emission matrices for the model described in the 
% tutorial above. There are two states corresponding to the two sodas: 
% coke and pepsi. I made the emission of a state equal to the state.
% That is, the emission of the "coke" state (== 1), is 1 (== coke)
% and.    the emission of the "pepsi" state (== 2), is 2 (== pepsi)

TRANS = [.9 .1; .2 .8;];

EMIS = [1, 0;...
0, 1];


% To generate a random sequence of states and emissions from the model, use hmmgenerate:

[seq,states] = hmmgenerate(10,TRANS,EMIS);

seq

states

% The output seq is the sequence of emissions and the output states is the sequence of states.

% hmmgenerate begins in state 1 at step 0, makes the transition to state i1 at step 1, and returns i1 as the first entry in states. 

% To change the initial state, see Changing the Initial State Distribution:
% To assign a different distribution of probabilities, p = [p1, p2, ..., pM], 


p = [.6, .4];

% to the M initial states, do the following:
% Create an M+1-by-M+1 augmented transition matrix and an M+1-by-N augmented emission matrix,  
% of the following form: 

TRANS_HAT = [0 p; zeros(size(TRANS,1),1) TRANS];

EMIS_HAT = [zeros(1,size(EMIS,2)); EMIS];


TRANS_HAT 

EMIS_HAT 

% Now you can do the generation (note that the state names will be incremented by 1).

[seq_HAT,states_HAT] = hmmgenerate(10,TRANS_HAT,EMIS_HAT);

seq_HAT

states_HAT


% Run this program several times to observe different sequence generations.
