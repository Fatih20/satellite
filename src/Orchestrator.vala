public class Satellite.Orchestrator {
    ProcessInfoProvider process_info_provider;

    CPUView cpu_view;
    CPUViewModel cpu_model;

    const int UPDATE_INTERVAL = 500;

    public Orchestrator (
        Satellite.CPUView cpu_view
    ) {
        this.cpu_view = cpu_view;
        this.process_info_provider = new ProcessInfoProvider ();
    }

    private void init_cpu () {
        cpu_model = new CPUViewModel(process_info_provider);
        cpu_view.set_model (cpu_model);
    }

    public void init () {
        init_cpu ();
    }

    public void start () {
        Timeout.add (UPDATE_INTERVAL, () => {
            cpu_model.refresh ();
            return true;
        });
    }
}
