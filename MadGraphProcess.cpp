//=============================================================================
// NOLI SE TANGERE
#include "CepGen/Processes/KTProcess.h"
#include "CepGen/Modules/ProcessesFactory.h"
#include "CepGen/Event/Event.h"
#include "CepGen/Core/Exception.h"
#include "CPPProcess.h"

using namespace cepgen;

class MadGraphProcess : public proc::KTProcess
{
  public:
    MadGraphProcess( const ParametersList& params );
    proc::ProcessPtr clone( const ParametersList& ) const override {
      return proc::ProcessPtr( new MadGraphProcess( *this ) );
    }

  private:
    void preparePhaseSpace() override;
    double computeKTFactorisedMatrixElement() override;
    void fillCentralParticlesKinematics() override;

    const std::string param_card_;
    CPPProcess proc_;
    Momentum qt_1_, qt_2_;
    std::vector<Momentum> p_cent_;
    std::vector<double*> momenta_;
};

MadGraphProcess::MadGraphProcess( const ParametersList& params ) :
  KTProcess( params, std::array<pdgid_t,2>{}, std::vector<pdgid_t>{} ),
  param_card_( params.get<std::string>( "parametersCard", "param_card.dat" ) )
{
  description_ = proc_.name();
  params_.set<std::string>( "description", description_ );
  CG_INFO( "MadGraphProcess" )
    << "Process considered: " << description_;
}

void
MadGraphProcess::preparePhaseSpace()
{
  //--- initialise the process
  try {
    proc_.initProc( param_card_ );
  } catch ( const char* chr ) {
    throw CG_FATAL( "MadGraphProcess" )
      << "Failed to initialise parameters card at \"" << param_card_ << "\":\n\t"
      << chr;
  }
  if ( proc_.nprocesses > 1 )
    throw CG_FATAL( "MadGraphProcess" )
      << "Multi-processes matrix elements are not supported!";
  momenta_.resize( proc_.nexternal );
  for ( size_t i = proc_.ninitial; i < proc_.nexternal; ++i )
    p_cent_.emplace_back( 0., 0., 0., proc_.getMasses().at( i ) );
}

double
MadGraphProcess::computeKTFactorisedMatrixElement()
{
  qt_1_ = Momentum::fromPtEtaPhi( qt1_, 0., phi_qt1_ );
  qt_2_ = Momentum::fromPtEtaPhi( qt2_, 0., phi_qt2_ );
  qt_1_.setMass( 0. );
  qt_2_.setMass( 0. );
  momenta_[0] = qt_1_.pVector().data();
  momenta_[1] = qt_2_.pVector().data();
  for ( size_t i = 0; i < p_cent_.size(); ++i )
    momenta_[2+i] = p_cent_.at( i ).pVector().data();
  proc_.setMomenta( momenta_ );
  proc_.sigmaKin();
  const double* me = proc_.getMatrixElements();
  return me[0]*constants::GEVM2_TO_PB;
}

void
MadGraphProcess::fillCentralParticlesKinematics()
{
  const auto& mom_filled = proc_.getMomenta();
  for ( const auto& mom4 : mom_filled ) {
    Momentum mom( mom4 );
    //CG_INFO( "" ) << mom;
  }
}

REGISTER_PROCESS( "mg5", "", MadGraphProcess )
//=============================================================================
