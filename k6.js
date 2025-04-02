import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    vus: 10,
    duration: '30s',
};

export default function () {
    var host = "localhost:8000";
    var endpoint_list = ["/", "/api/posts", "/api/posts/1"];

    endpoint_list.forEach(function (endpoint) {
        http.get("http://" + host + endpoint);
    });

    sleep(0.5);
}
