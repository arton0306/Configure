## Hypothesis and Algorithm
1. hypothesis (H): a model (i.g. perception)
2. algorithm (A): an algorithm to choose a good g from a model
3. types of output space:
   *  binary classification
   *  multiclass classification
   *  regression (a real number)
   *  structure learning
      *  hyperclass classification problem, huge multiclass without explicit class definition
      *  i.g. NLP, protein folding
   *  ... and more
4. types of data label (constriaint by current data in hand):
   *  supervised: with all labels
   *  semi-supervised: with a few labels (i.g. facebook face identifier)
   *  unsupervised
   *  reinforcement learning (i.g. ad system)
   *  ... and more
5. types of protocol
   *  batch
   *  online (sequential)
   *  active: will ask human to label a critical data actively

## Feasibility of Learning
Hoeffding's Inequality:
    u = x probabitily in bin
    v = x fraction in sample
    in big sample (N large), v is probably cose to u (within e)
    P[|v-u|>e] <= 2exp(-2Ne^2)
    the statement 'v=u' is probably approximately correct (PAC)
Note that this is just a upper bound, the real probability might be much lower than the value.

### perception
*  binary classifier
*  linear model:
   *  `sign[c_0 + sum(w_i * x_i)]`
   *  `sign[sum(w_i * x_i)] if adding x_0 as 1 for constant item`
   *  and so on ... they are of the same power
*  PLA: perception learning algorithm
   *  basic idea: choose a better w for wrong input x 
   *  `w_t+1 := w_t + y_n(t)*x_n(t), where y_n(t) = 1 or -1`
   *  note that there are many method (cyclic, random cyclic...) to implement PLA, just remember the basic idea (basic concept)
   *  a question: if the data is linear separable, can PLA always halt?
      *  yes, according to a non-trivial math provement!
      *  the result is not that important pratically because we don't know if the data is linear separable
*  if the data is not linear separable, how to get the best w to minimize the error?
   *  a NP-hard problem!
   *  a heuristic modified PLA can get a good solution: choose the better w when we update w (it need time to check which w is better)
