function approach(current, target, step) {
    if (abs(target - current) <= step) {
        return target; // ya casi llegó
    }
    return current + sign(target - current) * step;
}
