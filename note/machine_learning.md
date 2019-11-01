## Feasibility of Learning

### Hoeffding's Inequality

    u = x probabitily in bin
    v = x fraction in sample
    in big sample (N large), v is probably cose to u (within e)
    P[|v-u|>e] ≤ 2exp(-2Ne^2)
    the statement 'v=u' is probably approximately correct (PAC)

    Note that this is just a upper bound, the real probability might be much lower than the value.

### Vapnik-Chervonenkis (VC) bound:

#### Basic concepts to build VC bound
*  a dichotomy: a hypothesis 'limited' to the eyes of `x1, x2, ..., xn`
   *  |H(x1,x2,...xn)| depends on inputs (x1,x2,...,xn)
*  growth function: taking max of all possible (x1,x2,...,xn)
   *  `m_h(N)`: max{x1,x2,...,xn∈X} |H(x1,x2,...xn)|
*  shatter: if one possible set of N inputs whose all dichotomy can be implemented by H, call those N inputs `shattered` by H
*  breakpoint: minimun number of data that a H can not shatter

#### VC bound formula

    P[∃h∈H s.t. |Ein(h) - Eout(h)| > ε] ≤ 4m_h(2N)e^[(-1/8)N(ε^2)]

### VC dimension (breakpoint-1): the existed max number of points that can be shattered by H
*  pos-ray: 1
*  1D perceptron (pos/neg rays): 2
*  2D perceptron: 3
*  convex hul: ∞
*  `P_D[|Ein(h) - Eout(h)| > ε] ≤ 4(2N)^(d_vc)e^[(-1/8)N(ε^2)]`

#### How much data is data enough
*  in theorem: `10000*d_vc`
*  in practice: `10*d_vc` (because the theorem is deduced by many upper bound)
*  (i.g.) we only need 30 data for 2D perceptron

## Hypothesis and Algorithm
1. hypothesis set (H): a model (i.g. perception)
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

### perception
*  binary classifier
*  linear model:
   *  `sign[c_0 + sum(w_i * x_i)]`
   *  `sign[sum(w_i * x_i)] if adding x_0 as 1 for constant item`
   *  and so on ... they are of the same power
*  PLA: perception learning algorithm
   *  basic idea: choose a better w for wrong input x
   *  `w_t+1 := w_t + y_n(t)*x_n(t), where y_n(t) = 1 or -1`
   *  note that there are many method (cyclic, random cyclic, pocket...) to implement PLA, just remember the basic idea (basic concept)
   *  pocket means adding a `best_w` to store the best w whenever w is updated
      *  best_w is updated when finding a better w, while w is updated as regular
      *  It is an error that only using w (without best_w) and update w when new_w is better. It falls into local minimal very easily.
   *  a question: if the data is linear separable, can PLA always halt?
      *  yes, according to a non-trivial math provement!
      *  the result is not that important pratically because we don't know if the data is linear separable
*  if the data is not linear separable, how to get the best w to minimize the error?
   *  a NP-hard problem!
   *  a heuristic modified PLA can get a good solution: choose the better w when we update w (it need time to check which w is better)
