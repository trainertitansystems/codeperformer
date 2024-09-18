package com.example.webapp;

import org.springframework.stereotype.Service;
import java.util.concurrent.atomic.AtomicLong;
import java.util.Random;

@Service
public class TrafficService {

    private final AtomicLong requestCount = new AtomicLong(0);
    private final AtomicLong errorCount = new AtomicLong(0);
    private final Random random = new Random();

    public void handleRequest() {
        if (simulateError()) {
            errorCount.incrementAndGet();
        } else {
            requestCount.incrementAndGet();
        }
    }

    private boolean simulateError() {
        // Simulate a random error, 10% error rate
        return random.nextInt(10) == 0;
    }

    public long getRequestCount() {
        return requestCount.get();
    }

    public long getErrorCount() {
        return errorCount.get();
    }
}

