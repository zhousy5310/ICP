import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Int "mo:base/Int";



actor {
    func quicksort(xs : [var Int]){
    qs(xs, 0, xs.size()-1);
    };

    func qs(xs : [var Int], lo : Int, hi : Int) : (){
        if (lo >= hi){
            return;
        };

        let compare_num = xs[Int.abs(lo)];
        var i = lo : Int;
        var j = hi : Int;

        while (i < j){
        while (xs[Int.abs(j)] >= compare_num and i < j){
            j -= 1;
        };
        while (xs[Int.abs(i)] <= compare_num and i < j){
            i += 1;
        };
        if (i < j){
                exchange(xs,i,j);
        };
        };
        exchange(xs,lo,j);
        i+=1;
        j-=1;

        qs(xs, lo, j);
        qs(xs, i, hi);
    };

    func exchange(x : [var Int], i : Int, j : Int){
        var temp = x[Int.abs(i)];
        x[Int.abs(i)] := x[Int.abs(j)];
        x[Int.abs(j)] := temp;
    };

    public func qsort(arr:[Int]):async [Int]{
        var xs = Array.thaw<Int>(arr) : [var Int];
        quicksort(xs);
        let xsx = Array.freeze<Int>(xs) : [Int];
        return xsx;
    }
};