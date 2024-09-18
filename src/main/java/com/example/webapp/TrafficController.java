package com.example.webapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/traffic")
public class TrafficController {

    private final TrafficService trafficService;

    public TrafficController(TrafficService trafficService) {
        this.trafficService = trafficService;
    }

    @GetMapping("/handle")
    public String handleTraffic() {
        trafficService.handleRequest();
        return "Request processed!";
    }

    @GetMapping("/metrics")
    public String getMetrics() {
        return "Total Requests Handled: " + trafficService.getRequestCount() +
               "\nTotal Errors: " + trafficService.getErrorCount();
    }
}

