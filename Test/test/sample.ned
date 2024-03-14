import inet.node.inet.WirelessHost;
import inet.node.inet.StandardHost;
import inet.node.inet.Router;
import inet.node.wireless.AccessPoint;
import ned.DatarateChannel;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.common.lifecycle.LifecycleController;
network WirelessNetwork
{
    types:
        channel C extends DatarateChannel
        {
            datarate = 100Mbps;
            delay = 0.1us;
        }


    submodules:
        Fog1: StandardHost {
            @display("p=402,616;i=device/router");
        }
        Fog2: StandardHost {
            @display("p=582,616;i=device/router");
        }
        BaseBroker: StandardHost {
            @display("p=582,424;i=device/server;");
        }
        user: WirelessHost;
        router1: Router {
            @display("p=582,552;q=Tasks");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=222,50");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=60,50");
        }
        ap1: AccessPoint {
            @display("p=997,172");
        }
        ap2: AccessPoint {
            @display("p=133,172");
        }
        lifecycleController: LifecycleController {
            @display("p=50,50");
        }
    connections:
        Fog1.ethg++ <--> C <--> router1.ethg++;
        Fog2.ethg++ <--> C <--> router1.ethg++;
        router1.ethg++ <--> C <--> BaseBroker.ethg++;
        BaseBroker.ethg++ <--> C <--> ap1.ethg++;
        BaseBroker.ethg++ <--> C <--> ap2.ethg++;
        Fog1.ethg++ <--> C <--> router1.ethg++;
        Fog1.ethg++ <--> C <--> router1.ethg++;
}
