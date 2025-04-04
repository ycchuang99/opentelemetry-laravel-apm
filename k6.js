import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    vus: 10,
    duration: '10m',
};

export default function () {
    var host = "http://localhost:8000";
    var endpoint_list = ["/api/posts", "/api/posts/1"];

    endpoint_list.forEach(function (endpoint) {
        http.get(host + endpoint);
    });

    sleep(0.5);
}
