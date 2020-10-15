namespace PQPennyFlip {

    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation PrepareBellState(pair : Qubit[]) : Unit {        
        H(pair[0]);
        CNOT(pair[0], pair[1]);
    }

    ///
    /// Summary: The PQPennyFlip Game
    /// Accepts a double picard which is the probability Picard will flip the coin
    /// Demonstrates a very basic Quantum Game
    ///
    @EntryPoint()
    operation SimultaneousPQPennyFlip(picard_theta : Double, picard_phi : Double) : Unit {
        using(coins = Qubit[2]) {
            PrepareBellState(coins);
            let picardMove = Rx(picard_theta, _);
            let qMove = Rx(PI(), _);

            picardMove(coins[0]);
            qMove(coins[1]);

            let pResult = M(coins[0]);
            let qResult = M(coins[1]);

            if(pResult == qResult) { Message($"Picard wins: [{pResult}, {qResult}]"); }
            else { Message($"Q wins: [{pResult}, {qResult}]"); }
        }
    }
}

