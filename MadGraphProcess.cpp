//=============================================================================
// NOLI SE TANGERE
#include "CepGen/Processes/KTProcess.h"
#include "CepGen/Modules/ProcessesFactory.h"
#include "CepGen/Event/Event.h"
//=============================================================================

using namespace cepgen;

namespace
{
  extern "C"
  {
    void smatrix_( double p[][4], double* ans );
  }
}

class MadGraphProcess : public proc::KTProcess
{
  public:
    inline MadGraphProcess( const ParametersList& params ) :
      KTProcess( params, std::array<pdgid_t,2>{}, std::vector<pdgid_t>{} ) {
    }
    ~MadGraphProcess() = default;
    proc::ProcessPtr clone( const ParametersList& ) const override {
      return proc::ProcessPtr( new MadGraphProcess( *this ) );
    }

  private:
    void preparePhaseSpace() override {
    }
    double computeKTFactorisedMatrixElement() override {
      double ans;
      double p[10][4];
      smatrix_( p, &ans );
      return ans;
    }
    void fillCentralParticlesKinematics() override {
    }
};

//=============================================================================
// MAP name -> CalcHEP matrix element evaluation wrapper object
// usage:
//  REGISTER_PROCESS( "name", "description", class_name )
//=============================================================================

REGISTER_PROCESS( "dummy", "A dummy MadGraph process", MadGraphProcess )
